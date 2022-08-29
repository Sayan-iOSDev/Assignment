//
//  ProductDetailsViewModel.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import Foundation
import UIKit

class ProductDetailsViewModel: NSObject{
    
    override init(){
        super.init()
    }
    
    func getAPIDataForProductDetails(param: [String: Any], completion: @escaping (ProductDetailsModel?, ServiceError?) -> ()) {
        let request = ProductDetailsApi()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
}
