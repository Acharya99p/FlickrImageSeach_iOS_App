// Module Wrapper for network

import UIKit

class FlickrNetworkWapper: NSObject {
    static let sharedInstance = FlickrNetworkWapper()
    
    private override init() {
        super.init()
    }
    
    func getSearchData(keyword:String, page:String = "1", OnCompletion: @escaping (SearchResultModel) -> Void, OnError: @escaping (Error) -> Void){
        let urlString = ApiStrings.coreUrl + ApiStrings.method + "&api_key=" + ApiStrings.apiKey + "&format=json&nojsoncallback=1&safe_search=1" + "&text=" + keyword + "&page=" + page
        BaseNetworkManager.makeWebRequest(urlString: urlString, onCompletion: {object in
            let model = SearchResultModel.init(With: object)
                OnCompletion(model)
        }, OnError: {error in
                OnError(error)
        })
        
    }
}
