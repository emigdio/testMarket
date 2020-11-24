//
//  Product.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import Foundation

struct ProductJSON{
    
    static var name = "nombre"
    static var url = "url"
    
}

class Product{
    
    private var _name: String?
    private var _url: String?

    var name: String? {
        return _name
    }
    
    var url: String? {
        return _url
    }

    init(productDict: Dictionary<String, Any>){
        
        if let name = productDict[ProductJSON.name] as? String{
            self._name = name
        }
        
        if let url = productDict[ProductJSON.url] as? String{
            self._url = url
        }
        
    }

}
