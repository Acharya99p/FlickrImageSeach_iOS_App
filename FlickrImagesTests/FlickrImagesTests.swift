//  FlickrImagesTests

import XCTest
@testable import FlickrImages

class FlickrImagesTests: XCTestCase {

    var viewController: SearchViewController?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(viewController != nil, "Not Loaded")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testButtonTap(){
        viewController?.searchTextField = UITextField()
        viewController?.searchTextField.text = "apple"
        viewController?.searchTextField.becomeFirstResponder()
        viewController?.searchButtonTapped(self)
        XCTAssert(viewController?.searchTextField.isFirstResponder ==  false, "Tap fail")
    }

}
