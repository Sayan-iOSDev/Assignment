//
//  ProductDetailsViewModel.swift
//  ProductAssignment
//
//  Created by webwerks on 28/07/22.
//

import Foundation
struct Product_images : Codable {
	let id : Int
	let product_id : Int
	let image : String
	let created : String
	let modified : String

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case product_id = "product_id"
		case image = "image"
		case created = "created"
		case modified = "modified"
	}
}
