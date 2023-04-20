//
//  Helpers.swift
//  UIImage-UIKit
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, UIImage>()

extension UIImageView{
    func loadImage(url: String, cell: UIImageView) {
        let apiUrl = URL(string: url)!
        if let image = imageCache.object(forKey: url as NSString) {
            cell.image = image
            return
        }
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: apiUrl) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: url as NSString)
                        cell.image = image
                    }
                }
            }
        }
    }
}
