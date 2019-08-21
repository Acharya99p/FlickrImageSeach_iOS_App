// For Image caching and get image from cache

import UIKit

class FlickrImageManager: NSObject {
    static let sharedInstance = FlickrImageManager()
    
    private override init() {
        super.init()
    }
    
    func getImage(For url:String, OnCompletion: @escaping (UIImage,String) -> Void){
        if let image = checkInCache(For: url){
                OnCompletion(image,url)
                return
        }
        BaseNetworkManager.dowloadImage(urlString: url, onCompletion: {[weak self](data,urlStr) in
            if urlStr == url{
                if let image = UIImage(data: data){
                    self?.writeInCache(For: url, data: data)
                    OnCompletion(image, urlStr)
                }
            }
        }, OnError: {error in
            print("Not loaded")
        })
    }
    
    //To Check in cache for Image
    func checkInCache(For url:String)-> UIImage?{
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if urlStr == nil{
            return nil
        }
        
        let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = directoryURLs.appendingPathComponent(urlStr!)
        let fileUrl = filePath.path
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: fileUrl){
            let image = UIImage.init(contentsOfFile: fileUrl)
            return image
        }
        return nil
    }
    
    //Write image data to cache
    func writeInCache(For url:String, data:Data){
        let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if urlStr == nil{
            return
        }
        let directoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = directoryURLs.appendingPathComponent(urlStr!)
        
        do{
            try data.write(to: filePath)
            print("Write Done")
        }catch{
            print("Unable to write")
        }
    }
}
