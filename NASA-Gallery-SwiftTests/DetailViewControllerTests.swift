import XCTest
@testable import NASA_Gallery_Swift

class DetailViewControllerTests: XCTestCase {
    var sut: DetailViewController?
    var spy: DetailViewModel?
    
    override func setUp() {
        super.setUp()
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        sut?.pictureDetail = MockData.pictures?[0]
        sut?.loadViewIfNeeded()
    }
    
    func testDataLoaded() {
        XCTAssertEqual(sut?.pictureTitle.text, sut?.pictureDetail.title)
        XCTAssertEqual(sut?.pictureExplanation.text, sut?.pictureDetail.explanation)
        XCTAssertNotNil(sut?.pictureDetail.hdurl)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
