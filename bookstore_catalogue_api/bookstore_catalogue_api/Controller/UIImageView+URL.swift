//
//  UIImageView+URL.swift
//  bookstore_catalogue_api
//
//  Created by Leo Nugraha on 2021/8/27.
//

import Foundation
import UIKit

class ImageStore: NSObject {
    static let imageCache = NSCache<NSString, UIImage>()
}

extension UIImageView {

    public func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }

    public func load(urlStr: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: urlStr) else {
                return
            }

            func setImage(image: UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }

            let urlToString = url.absoluteString as NSString
            if let cachedImage = ImageStore.imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    ImageStore.imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            } else {
                setImage(image: nil)
            }
        }
    }

}
