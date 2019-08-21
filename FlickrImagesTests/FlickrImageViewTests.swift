//  FlickrImagesTests


import XCTest
@testable import FlickrImages

class FlickrImageViewTests: XCTestCase {

    var dummyImageUrl = "http://farm1.static.flickr.com/578/23451156376_8983a8ebc7.jpg"
    var imageView: UIImageView?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        imageView = UIImageView()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(imageView != nil, "Image View not found")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoadImage(){
        imageView?.loadImage(url: dummyImageUrl, OnCompletion: {flag in
            XCTAssert(flag, "Image not Loaded")
        })
    }
    

}
