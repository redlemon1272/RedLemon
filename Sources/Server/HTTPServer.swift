//
//  HTTPServer.swift
//  RedLemon
//
//  Vapor HTTP server on port 8080
//  Replaces Node.js Express server from ColorFruit
//

import Foundation
import Vapor

class HTTPServer {
    let app: Application

    private static var isLoggingInitialized = false

    init() throws {
        var env = try Environment.detect()
        if !Self.isLoggingInitialized {
            try LoggingSystem.bootstrap(from: &env)
            Self.isLoggingInitialized = true
        }

        app = Application(env)

        // Configure server with environment-based port (uses Config for production-ready defaults)
        let port = Config.serverPort
        app.http.server.configuration.hostname = "127.0.0.1"
        app.http.server.configuration.port = port

        // Enable CORS for web UI
        // Enable CORS - Restricted to local access
        // We allow specific local origins just in case a WebView is used, plus custom auth header
        let corsConfiguration = CORSMiddleware.Configuration(
            allowedOrigin: .any(["http://localhost", "http://127.0.0.1", "redlemon://app"]),
            allowedMethods: [.GET, .POST, .PUT, .PATCH, .DELETE, .OPTIONS],
            allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin, "X-RedLemon-Auth"]
        )

        let cors = CORSMiddleware(configuration: corsConfiguration)
        app.middleware.use(cors, at: .beginning)
        
        // Secure API with Token Authentication
        app.middleware.use(LocalAuthMiddleware())

        // Register routes
        try routes(app)

        print("✅ HTTP Server configured on http://127.0.0.1:\(port)")
    }

    func start() async throws {
        print("🚀 Starting HTTP server...")

        defer { app.shutdown() }

        // Initialize providers BEFORE starting server
        await initializeProviders()

        try await app.startup()

        let port = app.http.server.configuration.port
        print("✅ HTTP server running on http://127.0.0.1:\(port)")
        print("")
        print("🔗 Available endpoints:")
        print("   http://127.0.0.1:\(port)/health")
        print("   http://127.0.0.1:\(port)/status")
        print("   http://127.0.0.1:\(port)/api/health")
        print("")

        // Wait for shutdown signal
        if let running = app.running {
            try await running.onStop.get()
        }
    }

    private func initializeProviders() async {
        // Providers now fetch credentials dynamically from KeychainManager on each request.
        // This ensures that if the user restores an account or updates keys,
        // the providers pick up the changes immediately without restart.
        
        let torrentio = TorrentioService()
        let comet = CometService()
        let zilean = ZileanService()
        let mediafusion = MediaFusionService()
        let debridSearch = DebridSearchService()

        await ProviderManager.shared.register(provider: torrentio)
        await ProviderManager.shared.register(provider: comet)
        await ProviderManager.shared.register(provider: zilean)
        await ProviderManager.shared.register(provider: mediafusion)
        await ProviderManager.shared.register(provider: debridSearch)

        print("✅ Providers initialized: torrentio, comet, zilean, mediafusion, debridsearch")
    }

    func routes(_ app: Application) throws {
        // Health check
        app.get("health") { req async -> Response in
            let response = Response(status: .ok)
            response.body = .init(string: "{\"ok\":true,\"service\":\"RedLemon\"}")
            response.headers.contentType = .json
            return response
        }

        app.get("status") { req async -> Response in
            let response = Response(status: .ok)
            response.body = .init(string: "{\"ok\":true}")
            response.headers.contentType = .json
            return response
        }

        // API info
        app.get("api", "health") { req async -> Response in
            let port = self.app.http.server.configuration.port
            let info = [
                "ok": true,
                "service": "RedLemon",
                "port": port,
                "version": "1.0.14",
                "phase": "Foundation + Credentials + RealDebrid + All Providers",
                "providers": ["torrentio", "comet", "zilean", "mediafusion", "debridsearch"],
                "endpoints": [
                    "GET  /health",
                    "GET  /status",
                    "GET  /api/health",
                    "POST /tokens/save",
                    "POST /tokens/delete",
                    "GET  /tokens/list",
                    "POST /api/streams/unlock",
                    "POST /api/streams/resolve",
                    "POST /api/streams/resolveByQuality"
                ]
            ] as [String : Any]

            let jsonData = try! JSONSerialization.data(withJSONObject: info)
            let response = Response(status: .ok)
            response.body = .init(data: jsonData)
            response.headers.contentType = .json
            return response
        }

        // Register feature routes
        registerTokenRoutes(app)
        registerUnlockRoutes(app)
        registerStreamRoutes(app)
        registerMetadataRoutes(app)
        registerProxyRoutes(app)
        registerSubtitleRoutes(app)

        print("✅ All routes registered")
    }
}
