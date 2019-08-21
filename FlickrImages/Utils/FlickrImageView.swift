// To Load image from network and display

import UIKit

extension UIImageView {
    func loadImage(url:String, OnCompletion: ((Bool) -> Void)?){
        let urls = url
        FlickrImageManager.sharedInstance.getImage(For: urls, OnCompletion: {image,urlStr in
            if url == urlStr{
                self.image = image
                if let block = OnCompletion{
                    block(true)
                }
            }
        })
    }
}
