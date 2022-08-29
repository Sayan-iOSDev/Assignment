//
//  DatabaseHelper.swift
//  ProductAssignment
//
//  Created by webwerks on 29/07/22.
//

import Foundation
import CoreData
import UIKit

protocol ProductStorage{
    func saveProductList(product: DataProduct,completion: @escaping (Result<Bool,Error>)-> ())
}
class DatabaseHelper{
    
//    private let productStorage: ProductStorage
//    init(storage: ProductStorage) {
//        productStorage = storage
//    }
    static var sharedInstance = DatabaseHelper()
    private init(){}
    // save data into coreData databasse
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func saveProductList(product: DataProduct,completion: @escaping (Result<Bool,Error>)-> ()){
        let productList = NSEntityDescription.insertNewObject(forEntityName: "ProductDetails", into: context!) as! ProductDetails
        productList.product_id = Int64(product.id)
        productList.product_category_id = Int64(product.product_category_id)
        productList.cost = Int64(product.cost)
        productList.rating = Int64(product.rating)
        productList.view_count = Int64(product.view_count)
        productList.name = product.name
        productList.producer = product.producer
        productList.product_description = product.description
        productList.created = product.created
        productList.modified = product.modified
        productList.product_images = product.product_images
        do{
            try context?.save()
        }catch{
            print("Data is not save")
        }
    }
}

