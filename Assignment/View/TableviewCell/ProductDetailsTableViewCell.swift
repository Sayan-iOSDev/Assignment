//
//  ProductDetailsTableViewCell.swift
//  ProductAssignment
//
//  Created by webwerks on 29/07/22.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    fileprivate var modelProductDetails: DataProductDetailsModel?{
        didSet{
            lblProductName.text = modelProductDetails?.name
            lblProducerNameProduct.text = modelProductDetails?.producer
            let cost = modelProductDetails?.cost
            lblCostProduct.text = "Rs.\(cost!)"
            let rating = modelProductDetails?.rating
            lblRatingProduct.text = "Rating \(rating!)"
            lblDescriptionProduct.text = modelProductDetails?.description
        }
    }
    
    @IBOutlet weak var btnSaveProduct: UIButton!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProducerNameProduct: UILabel!
    @IBOutlet weak var lblCostProduct: UILabel!
    @IBOutlet weak var lblRatingProduct: UILabel!
    @IBOutlet weak var lblDescriptionProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailsConfiguration(datadict: DataProductDetailsModel){
        self.modelProductDetails = datadict
    }
}
