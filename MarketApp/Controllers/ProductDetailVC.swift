//
//  ProductDetailVC.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    var product:Product?
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageUrl = product?.url {
            
            self.imageProduct.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "logo"), completed: nil)
            
        }
    
        self.labelName.text = product?.name

    }

    @IBAction func closeScreen(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
