//
//  UIImageView+BWExtensions.swift
//  BWKit_swift
//
//  Created by fwb on 2021/4/1.
//

import UIKit
//import YYKit
import Kingfisher
public extension BWSpace where Base:UIImageView{
    func imageUrlString(_ urlStr:String){
        guard !urlStr.bw.isBlank else {
            return
        }
        self.base.kf.setImage(with: URL(string: urlStr))
    }
    func imageUrlString(_ urlStr:String , placeImage:UIImage) {
        guard !urlStr.bw.isBlank else {
            return
        }
        self.base.kf.setImage(with: URL(string: urlStr), placeholder: placeImage, options: nil, progressBlock: nil, completionHandler: nil)
    }
    func imageUrlString(_ urlStr:String , complete:@escaping (UIImage) -> Void){
        guard !urlStr.bw.isBlank else {
            return
        }
        self.base.kf.setImage(with: URL(string: urlStr), placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
            guard let image = image else{
                return
            }
            complete(image)
        }

    }
}

