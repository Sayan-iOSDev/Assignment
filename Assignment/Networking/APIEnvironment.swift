//
//  APIEnvironment.swift
//  Assignment
//
//  Created by webwerks on 16/08/22.
//

import Foundation
enum APIEnvironment {
    case development
    case staging
    case production
    
    func baseURL () -> String {
        return "http://\(subdomain())/\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "trainingapp/api"
        case .staging:
            return "trainingapp/api"
        case .production:
            return "trainingapp/api"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "staging.php-dev.in:8844"
        }
    }
    
//    func route() -> String {
//        return "/api/v1"
//    }
}
