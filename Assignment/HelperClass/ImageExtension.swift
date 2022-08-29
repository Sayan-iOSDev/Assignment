//
//  ImageExtension.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - Imageview extension to download image

extension UIImageView {
    func setImage(ImageUrl: String){
        self.kf.setImage(with: URL(string: ImageUrl))
    }
}
