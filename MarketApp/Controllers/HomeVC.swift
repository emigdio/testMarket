//
//  HomeVC.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {
    
    var imagesPresenter = ImagesPresenter()

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self as UITableViewDataSource
        tableView.register(UINib(nibName: CellIDs.productCell, bundle: nil), forCellReuseIdentifier: CellIDs.productCell)

        self.imagesPresenter.getImageDelegate = self
        self.imagesPresenter.getImages()
        
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
        
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
        
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIDs.productCell, for: indexPath) as! ProductCell
            
        let product = self.products[indexPath.row]
        
        if let imageUrl = product.url {
            
            cell.imageProduct.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "logo"), completed: nil)
            
        }
    
        cell.labelName.text = product.name

        cell.selectionStyle = .none
        
        return cell
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = self.products[indexPath.row]
        
        let vc = ProductDetailVC()
   
        vc.product = product
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
}

extension HomeVC:GetImageDelegate{
    
    func getImageSucess(content: [String : Any]?) {
        
        if let dataImages = content?[API.data] as? [Dictionary<String,Any>]{
            
            for productDict in dataImages {
                
                let product = Product(productDict:productDict)
                
                self.products.append(product)
                
            }
            
            self.spinner.stopAnimating()
            self.tableView.reloadData()
            
        }
 
    }
    
    func getImageFail(error: String) {
        
        self.spinner.stopAnimating()
        
        let textButton = NSLocalizedString("OK", comment: "")
        let okOption = UIAlertAction(title: textButton, style: .cancel, handler: nil)
        let alert = UIAlertController(title: "Market App", message: error, preferredStyle: .alert)
        alert.addAction(okOption)
        present(alert, animated: true, completion: nil)
        
    }

}

