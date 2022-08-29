//
//  ProductListCell.swift
//  ProductAssignment
//
//  Created by webwerks on 27/07/22.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var lblNameProduct: UILabel!
    @IBOutlet weak var lblProducerProduct: UILabel!
    @IBOutlet weak var lblCostProduct: UILabel!
    
    // MARK: - Variables
    fileprivate var productDict : DataProduct? {
        didSet {
            self.lblNameProduct.text = productDict?.name
            self.lblProducerProduct.text = productDict?.producer
            self.lblCostProduct.text = "Rs.\(productDict?.cost ?? 0)"
            imgVwProduct.setImage(ImageUrl: productDict?.product_images ?? "")
        }
    }
    
    // MARK: - Closures for data passing
    public var didClickOnSaveButton : (() -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Populate cell data
    func populateCellData(detailDict : DataProduct){
        self.productDict = detailDict
    }
    
    // MARK: - ACTION
    @IBAction func sendBtnAction(_ sender: Any) {
        if let button = sender as? UIButton {
            if button.isSelected {
                // set deselected
                button.isSelected = false
                button.setImage(UIImage(named: "suit.heart"), for: .normal)
            } else {
                // set selected
                button.isSelected = true
                button.setImage(UIImage(named: "suit.heart.fill"), for: .normal)
            }
        }
        self.didClickOnSaveButton?()

    }
}
