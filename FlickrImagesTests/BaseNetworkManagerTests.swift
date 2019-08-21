//  FlickrImagesTests


import XCTest
@testable import FlickrImages

class BaseNetworkManagerTests: XCTestCase {

    let url = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736&format=json&nojsoncallback=1&safe_search=1&text=kittens"
    var dummyImageUrl = "http://farm1.static.flickr.com/578/23451156376_8983a8ebc7.jpg"
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMakeWebRequest(){
        BaseNetworkManager.makeWebRequest(urlString: url, onCompletion: {dict in
            XCTAssertNotNil(dict)
        }, OnError: {error in
            XCTAssertNotNil(error)
        })
    }
    
    func testDownloadImage(){
        BaseNetworkManager.dowloadImage(urlString: dummyImageUrl, onCompletion: {data,String in
            XCTAssertNotNil(data)
        }, OnError: {error in
            XCTAssertNotNil(error)
        })
    }

}
