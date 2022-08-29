//
//  ProductListApi.swift
//  Assignment
//
//  Created by webwerks on 16/08/22.
//

import Foundation

struct ProductListApi: APIHandler{
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let urlString =  APIPath().getProductList
        if var url = URL(string: urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> ProductListNew {
        return try defaultParseResponse(data: data,response: response)
    }
}
