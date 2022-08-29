//
//  ProductImageCollectionViewCell.swift
//  ProductAssignment
//
//  Created by webwerks on 28/07/22.
//

import UIKit

class ProductImageCollectionViewCell: UICollectionViewCell {
    
    var modelImage: Product_images?{
        didSet{
            imgVwProductImage.setImage(ImageUrl: modelImage?.image ?? "")
        }
    }
    
    @IBOutlet weak var imgVwProductImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - Populate cell data
    func populateCellData(imageDict : Product_images){
        self.modelImage = imageDict
    }
}
