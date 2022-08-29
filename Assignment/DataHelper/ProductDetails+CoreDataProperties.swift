//
//  ProductDetails+CoreDataProperties.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//
//

import Foundation
import CoreData


extension ProductDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductDetails> {
        return NSFetchRequest<ProductDetails>(entityName: "ProductDetails")
    }

    @NSManaged public var cost: Int64
    @NSManaged public var created: String?
    @NSManaged public var product_id: Int64
    @NSManaged public var modified: String?
    @NSManaged public var producer: String?
    @NSManaged public var product_category_id: Int64
    @NSManaged public var product_description: String?
    @NSManaged public var product_images: String?
    @NSManaged public var rating: Int64
    @NSManaged public var view_count: Int64
    @NSManaged public var name: String?

}

extension ProductDetails : Identifiable {

}
