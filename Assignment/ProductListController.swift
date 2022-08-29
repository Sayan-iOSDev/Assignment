//
//  ProductListController.swift
//  Assignment
//
//  Created by webwerks on 09/08/22.
//

import UIKit
import CoreData

class ProductListController: UIViewController{
    @IBOutlet weak var tblvwProductList: UITableView!
    var pageNo = 0
    private var productListViewModel : ProductListViewModel!
    private var listData = [DataProduct]()
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pageNo = 1
        commonInit()
    }
    
    // MARK: - Common method to be initialise
    func commonInit(){
        // navigation title and large title style
//        self.title = "Matches"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//
//        setting tableview delegate, datasource and registering cell classes
        self.tblvwProductList.register(UINib.init(nibName: Constants.kProductListCell, bundle: nil), forCellReuseIdentifier: Constants.kProductListCell)
        
        // Initialise viewmodel class
        self.productListViewModel = ProductListViewModel()
        self.productListViewModel.getAPIData(param: ["product_category_id":1,"page" : pageNo, "limit" : 10], completion: { (model, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.message, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let modelUW = model {
                    self.listData = modelUW.data
                    DispatchQueue.main.async {
                       self.tblvwProductList?.reloadData()
                    }
                }
            }
        })
    }
}

extension ProductListController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kProductListCell, for: indexPath)as? ProductListCell else {
            return UITableViewCell()
        }
        let item = self.listData[indexPath.row]
        cell.populateCellData(detailDict: item)
        cell.didClickOnSaveButton = {
            print("Clicked on: \(indexPath.row)")
            self.productListViewModel.saveProduct(productDict: item)
        }
        return cell
    }
}

extension ProductListController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modelProduct = self.listData[indexPath.row]
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProductDetailsController") as? ProductDetailsController
        vc?.productId = modelProduct.id
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
