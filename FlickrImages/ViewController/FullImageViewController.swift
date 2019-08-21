// To View full image



import UIKit

class FullImageViewController: UIViewController {

    var model: FlickrImageModel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.layer.borderWidth = 0.5
        self.containerView.layer.cornerRadius = 8
        
        if let imgUrl = model.imageUrl{
            mainImgView.loadImage(url: imgUrl, OnCompletion: nil)
        }
        titleLbl.text = model.title
    }
}
