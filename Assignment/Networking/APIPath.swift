//
//  APIPath.swift
//  Assignment
//
//  Created by webwerks on 16/08/22.
//

import Foundation


#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIPath {
    var getProductList: String { return "\(baseURL)/products/getList"}
    var getProductDetails: String { return "\(baseURL)/products/getDetail"}
}


