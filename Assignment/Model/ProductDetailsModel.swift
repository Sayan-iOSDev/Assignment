//
//  ProductDetailsViewModel.swift
//  ProductAssignment
//
//  Created by webwerks on 28/07/22.
//

import Foundation
struct ProductDetailsModel : Codable {
	let status : Int
	let data : DataProductDetailsModel

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case data = "data"
	}
}
