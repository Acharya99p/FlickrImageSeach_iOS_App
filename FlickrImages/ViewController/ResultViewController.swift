// To display all result for searched keyword with scrolling

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    var searchResultList = [FlickrImageModel]()
    var keyword: String! = ""
    var page: Int = 1
    var isCallInProgess = false
    var is2x2 = false
    var btnText = "2x2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.title = String(keyword).capitalized
        
        self.registerCollectionView()
        self.addButton()
        
        loader.hidesWhenStopped = true
        loadData()
    }
    
    func registerCollectionView(){
        self.resultCollectionView.dataSource = self
        self.resultCollectionView.delegate = self
        self.resultCollectionView.register(UINib(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "imageCell")
    }
    
    func addButton(){
        let switchButton = UIBarButtonItem(title: btnText, style: .plain, target: self, action: #selector(switchGrid))
        self.navigationItem.rightBarButtonItem = switchButton
    }
    
    @objc func switchGrid(){
        if is2x2{
            btnText = "2x2"
        }else{
            btnText = "3x3"
        }
        self.is2x2 = !self.is2x2
        addButton()
        self.resultCollectionView.reloadData()
    }
    
    func loadData(){
        isCallInProgess = true
        if page == 1{
            loader.startAnimating()
        }
        FlickrNetworkWapper.sharedInstance.getSearchData(keyword: self.keyword,page: String(page), OnCompletion: {[weak self] model in
            self?.loader.stopAnimating()
            self?.isCallInProgess = false
            self?.searchResultList.append(contentsOf: model.searchList)
            if self?.searchResultList.count == 0{
                self?.showAlert()
            }
            self?.resultCollectionView.reloadData()
            }, OnError: {error in
                self.showAlert()
        })
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Flickr", message: "Something went wrong", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {action in
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ResultViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResultList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == searchResultList.count - 6{
            if !isCallInProgess{
                page = page + 1
                loadData()
            }
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        cell.setImage(model: searchResultList[indexPath.row])
        return cell
    }
}

extension ResultViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.size.width
        if is2x2{
            return CGSize(width: (screenWidth/2) - 14, height: screenWidth/2)
        }
        return CGSize(width: (screenWidth/3) - 14, height: screenWidth/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = searchResultList[indexPath.row]
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullImageViewController") as? FullImageViewController{
            vc.model = model
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
