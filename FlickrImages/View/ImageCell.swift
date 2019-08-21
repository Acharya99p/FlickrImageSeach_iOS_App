//Image Cell to display image on UI

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var flickrImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImage(model:FlickrImageModel){
        if let url = model.imageUrl{
            flickrImgView.loadImage(url: url, OnCompletion: nil)
        }
    }
}
