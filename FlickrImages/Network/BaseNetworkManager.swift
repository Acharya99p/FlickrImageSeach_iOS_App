//Network Manager for making api calls

import UIKit

class BaseNetworkManager: NSObject {
    
    class func makeWebRequest(urlString:String,onCompletion: @escaping ([String:Any]) -> Void, OnError: @escaping (Error)->Void){
        if let url = URL.init(string: urlString){
            let urlRequest = URLRequest.init(url: url)
            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest, completionHandler: {data, response, error in
                if let e = error{
                    DispatchQueue.main.async {
                        OnError(e)
                    }
                }else if let d = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: d, options: .mutableLeaves)
                        if let object = json as? [String:Any]{
                            DispatchQueue.main.async {
                                onCompletion(object)
                            }
                        }
                    }catch{
                        print("Error!")
                    }
                }
            })
            task.resume()
        }
    }
    
    class func dowloadImage(urlString:String,onCompletion: @escaping (Data,String) -> Void, OnError: @escaping (Error)->Void){
        if let url = URL.init(string: urlString){
            let urlRequest = URLRequest.init(url: url)
            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest, completionHandler: {data, response, error in
                if let e = error{
                    DispatchQueue.main.async {
                        OnError(e)
                    }
                }else if let d = data{
                        DispatchQueue.main.async {
                            onCompletion(d, (urlRequest.url?.absoluteString)!)
                        }
                }
            })
            task.resume()
        }
    }
}
