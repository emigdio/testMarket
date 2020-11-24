//
//  ImagesServices.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import Foundation
import Alamofire

class ImagesServices{
    
    static func getImages( successBlock:@escaping (_ message:[String:Any]?) -> (), errorBlock: @escaping (_ error: AnyObject?) -> ()) {
        
        let api = API()
        let path = api.getImagesUrl()
        AF.request(path, method: .get, parameters:nil, encoding: JSONEncoding.default, headers:nil).validate().responseJSON { response in
            
            print(response.result)
            
            switch response.result {
 
            case .success:
                if let responseDict = response.value as? [String:AnyObject] {
                    print(responseDict)
                    successBlock(responseDict)
                    return
                }
                errorBlock(nil)
            case .failure(let error):
                print(error)
                errorBlock(error as AnyObject)
                return
                
            }
        }
        
    }

}
