//
//  ProductCell.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
