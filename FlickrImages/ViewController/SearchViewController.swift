// Search View Controller to enter keyword and search

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius = 4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func searchButtonTapped(_ sender: Any) {
        if searchTextField.isFirstResponder{
            searchTextField.resignFirstResponder()
        }
        if searchTextField.text == nil || searchTextField.text == "" {
            showAlert()
            return
        }
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController{
            vc.keyword = searchTextField.text
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Flickr", message: "Please enter a keyword to search", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

