//
//  ProductListViewModel.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import Foundation
import UIKit
//import CoreData

class ProductListViewModel : NSObject{
    
    // MARK: - Overriding init method
    override init() {
        super.init()
    }
    // MARK: - Function to get data from service class
    
    func getAPIData(param: [String: Any], completion: @escaping (ProductListNew?, ServiceError?) -> ()) {
        let request = ProductListApi()
        
        let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(requestData: param) { (model, error) in
            if let _ = error {
                completion(nil, error)
            } else {
                completion(model, nil)
            }
        }
    }
    
    func saveProduct(productDict : DataProduct){
        
        let databaseHelper = DatabaseHelper.sharedInstance
        databaseHelper.saveProductList(product: productDict){ (result) in
            switch result {
            case .success(let finished):
                if finished{
                    print("Finished successfully")
                }else{
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}

