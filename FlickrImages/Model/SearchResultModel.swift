// Data Model with sample JSON

import UIKit


class SearchResultModel : NSObject{
    var searchList = [FlickrImageModel]()
    init(With dict:[String:Any]) {
        super.init()
        if let photoObj = dict["photos"] as? [String:Any]{
            if let photoList = photoObj["photo"] as? [Any]{
                searchList = [FlickrImageModel]()
                for object in photoList{
                    if let photo = object as? [String:Any]{
                        let model = FlickrImageModel.init(With: photo)
                        self.searchList.append(model)
                    }
                }
            }
        }
    }
}

/*
 {
 "id": "40489172004",
 "owner": "44865407@N07",
 "secret": "54656b12ca",
 "server": "797",
 "farm": 1,
 "title": "_DSC4700",
 "ispublic": 1,
 "isfriend": 0,
 "isfamily": 0
 }
 
 https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
 */
class FlickrImageModel: NSObject {
    var id : String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var imageUrl: String?
    
    init(With dict:[String:Any]) {
        super.init()
        if let nodeValue = dict["id"]{
            self.id = nodeValue as? String
        }
        if let nodeValue = dict["owner"]{
            self.owner = nodeValue as? String
        }
        if let nodeValue = dict["secret"]{
            self.secret = nodeValue as? String
        }
        if let nodeValue = dict["server"]{
            self.server = nodeValue as? String
        }
        if let nodeValue = dict["farm"]{
            self.farm = (nodeValue as? NSNumber)?.intValue
        }
        if let nodeValue = dict["title"]{
            self.title = nodeValue as? String
        }
        
        if let farmId = self.farm, let serverId = self.server, let id = self.id, let secretKey = self.secret{
            self.imageUrl = "https://farm\(farmId).staticflickr.com/\(serverId)/\(id)_\(secretKey).jpg"
        }
    }
}



