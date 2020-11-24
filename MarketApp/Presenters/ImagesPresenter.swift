//
//  ImagesPresenter.swift
//  MarketApp
//
//  Created by EMIGDIO CAMACHO CALDERON on 11/24/20.
//

import Foundation

protocol GetImageDelegate: NSObjectProtocol {
    
    func getImageSucess(content:[String:Any]?)
    
    func getImageFail(error: String)
    
}

class ImagesPresenter{
    
    var getImageDelegate: GetImageDelegate?
    
    func getImages() {
        ImagesServices.getImages(successBlock: { (message) in
                self.getImageDelegate?.getImageSucess(content: message)
                }, errorBlock: { (error) in
                    if let error = error as? String {
                        self.getImageDelegate?.getImageFail(error: error)
                    }else{
                        self.getImageDelegate?.getImageFail(error: "error desconocido")
                    }
                })
            
        }
    
}
