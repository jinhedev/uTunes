//
//  CustomUIImageView.swift
//  uTunes
//
//  Created by rightmeow on 8/31/17.
//  Copyright © 2017 Duckensburg. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomUIImageView: UIImageView {

    var imageURLString: String?

    func loadImageUsingCacheWithURLString(_ URLString: String) {
        imageURLString = URLString

        let url = URL(string: URLString)
        // check cache for image first
        if let imageFromCache = imageCache.object(forKey: URLString as NSString) {
            DispatchQueue.main.async {
                self.image = nil
                self.image = imageFromCache
                return
            }
        } else {
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    print("Caught an error in URLSession: ", error ?? "Default error value: nil")
                    return
                }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    if self.imageURLString == URLString {
                        self.image = nil
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache!, forKey: URLString as NSString)
                }
            }).resume()
        }
    }

}
