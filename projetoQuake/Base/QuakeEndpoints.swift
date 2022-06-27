//
//  QuakeEndpoints.swift
//  projetoQuake
//
//  Created by Roberto Edgar Geiss on 21/06/22.
//

import Foundation

protocol APIBuilder
{
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum QuakeAPI {
    case getNews
}

extension QuakeAPI: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://earthquake.usgs.gov/fdsnws/event/1/")!
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/1"

        }
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
