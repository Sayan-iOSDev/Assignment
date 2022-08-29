//
//  ProductDetailsController.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import UIKit

class ProductDetailsController: UIViewController{
    
    @IBOutlet weak var tblVwProductDetails: UITableView!
    @IBOutlet weak var collectionVwProductImage: UICollectionView!
    var productId : Int = 0
    private var arrImageList = [Product_images]()
    private var productDetailsViewModel : ProductDetailsViewModel!
    private var detailsData: DataProductDetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    // MARK: - Common method to be initialise
    func commonInit(){
        // navigation title and large title style
//        // setting collectionview delegate, datasource and registering cell classes
        collectionVwProductImage.register(UINib(nibName: Constants.kProductDetailsCollectionCell, bundle: nil), forCellWithReuseIdentifier: Constants.kProductDetailsCollectionCell)
        tblVwProductDetails.register(UINib.init(nibName: Constants.kProductDetailsValueTableCell, bundle: nil), forCellReuseIdentifier: Constants.kProductDetailsValueTableCell)
        
        // Initialise viewmodel class
        self.productDetailsViewModel = ProductDetailsViewModel()
        self.productDetailsViewModel.getAPIDataForProductDetails(param: ["product_id":self.productId], completion: { (model, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.message, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let modelUW = model {
                    self.arrImageList = modelUW.data.product_images
                    self.detailsData = modelUW.data
                    DispatchQueue.main.async {
                        self.collectionVwProductImage.reloadData()
                       self.tblVwProductDetails.reloadData()
                    }
                }
            }
        })
    }
    
    @IBAction func buttonBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailsController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.kProductDetailsCollectionCell, for: indexPath)as? ProductImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = self.arrImageList[indexPath.row]
        cell.populateCellData(imageDict: item)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrImageList.count
    }
}

extension ProductDetailsController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kProductDetailsValueTableCell, for: indexPath)as? ProductDetailsTableViewCell else {
            return UITableViewCell()
        }
        if self.detailsData != nil {
            cell.productDetailsConfiguration(datadict: self.detailsData!)
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
}
