import XCTest
@testable import NASA_Gallery_Swift

class DetailViewModelTests: XCTestCase {
    var sut: DetailViewModel?
    let imageView = UIImageView()
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testLoadingIndicator() {
        sut?.displayLoadingView(imageView: imageView)
        RunLoop.current.run(until: Date())
        
        guard let activityIndicator = sut?.activityIndicator else {
            return
        }
        
        XCTAssertTrue(activityIndicator.isDescendant(of: imageView))
        XCTAssertTrue(activityIndicator.isAnimating)
        
        sut?.hideLoadingView()
        
        XCTAssertTrue(!activityIndicator.isDescendant(of: imageView))
    }
}
