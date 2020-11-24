//
//  Constants.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import Foundation

class API{
    
    static let data = "data"
    
    func getBaseURL() -> String{
        if let path = Bundle.main.path(forResource: "URL", ofType: "plist"){
            if let URLSDict = NSDictionary(contentsOfFile: path) as? Dictionary<String, String>{
                if let baseURL =  URLSDict["base_url"]{
                    return baseURL
                }
            }
        }
        return ""
    }
    
    func getImagesUrl() -> String {
        
        return "\(getBaseURL())/api/enums/imagenes"
    }
    
}

struct CellIDs{
    
    static let productCell = "ProductCell"
 
}
