//
//  ProductDetailsViewModel.swift
//  ProductAssignment
//
//  Created by webwerks on 28/07/22.
//

import Foundation
struct DataProduct : Codable {
	let id : Int
	let product_category_id : Int
	let name : String
	let producer : String
	let description : String
	let cost : Int
	let rating : Int
	let view_count : Int
	let created : String
	let modified : String
	let product_images : String

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case product_category_id = "product_category_id"
		case name = "name"
		case producer = "producer"
		case description = "description"
		case cost = "cost"
		case rating = "rating"
		case view_count = "view_count"
		case created = "created"
		case modified = "modified"
		case product_images = "product_images"
	}
}
