//  FlickrImagesTests


import XCTest
@testable import FlickrImages

class SearchResultModelTests: XCTestCase {

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
    
    func testLoad(){
        let model = SearchResultModel(With: [String:Any]())
        XCTAssert(model.searchList.count == 0, "More Object")
        
        let image = FlickrImageModel(With: [String:Any]())
        XCTAssert(image.imageUrl == nil, "Not Loaded")
        
        model.searchList.append(image)
        XCTAssert(model.searchList.count == 1, "Object Not Found")

    }

}
