//
//  TokenRoutes.swift
//  RedLemon
//
//  Token/credential management endpoints
//  POST /tokens/save
//  POST /tokens/delete  
//  GET  /tokens/list
//

import Foundation
import Vapor

func registerTokenRoutes(_ app: Application) {
    let keychain = KeychainManager.shared
    
    // POST /tokens/save
    app.post("tokens", "save") { req async throws -> Response in
        struct SaveRequest: Codable {
            let service: String
            let token: String
        }
        
        let body = try req.content.decode(SaveRequest.self)
        
        guard !body.service.isEmpty && !body.token.isEmpty else {
            throw Abort(.badRequest, reason: "Missing service or token")
        }
        
        try await keychain.save(credential: body.token, for: body.service)
        
        let response = Response(status: .ok)
        response.body = .init(string: "{\"saved\":true}")
        response.headers.contentType = .json
        return response
    }
    
    // POST /tokens/delete
    app.post("tokens", "delete") { req async throws -> Response in
        struct DeleteRequest: Codable {
            let service: String
        }
        
        let body = try req.content.decode(DeleteRequest.self)
        
        guard !body.service.isEmpty else {
            throw Abort(.badRequest, reason: "Missing service")
        }
        
        try await keychain.delete(service: body.service)
        
        let response = Response(status: .ok)
        response.body = .init(string: "{\"deleted\":true}")
        response.headers.contentType = .json
        return response
    }
    
    // GET /tokens/list
    app.get("tokens", "list") { req async throws -> Response in
        let services = await keychain.listServices()
        
        let json = try JSONEncoder().encode(["services": services])
        
        let response = Response(status: .ok)
        response.body = .init(data: json)
        response.headers.contentType = .json
        return response
    }
    
    print("✅ Token routes registered:")
    print("   POST /tokens/save") // OK
    print("   POST /tokens/delete") // OK
    print("   GET  /tokens/list") // OK
}
