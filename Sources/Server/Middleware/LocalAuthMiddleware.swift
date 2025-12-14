import Vapor

struct LocalAuthMiddleware: AsyncMiddleware {
    func respond(to request: Request, chainingTo next: AsyncResponder) async throws -> Response {
        // Exempt health and status endpoints
        if request.url.path == "/health" || request.url.path == "/status" || request.url.path == "/api/health" {
             return try await next.respond(to: request)
        }

        // Allow OPTIONS requests for CORS preflight (if CORS middleware is after this? actually CORS usually handles this first)
        // Vapor's CORSMiddleware should be sufficient, but we must ensure we don't block OPTIONS if this middleware runs.
        // However, middleware order matters. We will register this on a route group.
        
        // Check for X-RedLemon-Auth header
        guard let token = request.headers.first(name: "X-RedLemon-Auth") else {
            throw Abort(.unauthorized, reason: "Missing authentication token")
        }
        
        // Validate token against Config
        guard token == Config.localAuthToken else {
            throw Abort(.unauthorized, reason: "Invalid authentication token")
        }
        
        return try await next.respond(to: request)
    }
}
