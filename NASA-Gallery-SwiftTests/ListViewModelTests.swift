import XCTest
@testable import NASA_Gallery_Swift

class ListViewModelTests: XCTestCase {
    var sut: ListViewModel?
    var spy: WebServiceSpy?
    
    override func setUp() {
        super.setUp()

    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testSuccessCase() {
        spy?.getAstronomyPictureOfTheDaySuccess { callback in
            switch callback {
                case .success(let pictures):
                    self.sut?.astronomyPictures = pictures
                    XCTAssertNotNil(self.sut?.astronomyPictures)
                case .failure(_):
                    XCTAssertTrue(UIAlertController().isBeingPresented)
            }
        }
    }
    
    func testFailedCase() {
        spy?.getAstronomyPictureOfTheDaySuccess { callback in
            switch callback {
                case .success(let pictures):
                    self.sut?.astronomyPictures = pictures
                    XCTAssertNotNil(self.sut?.astronomyPictures)
                case .failure(_):
                    XCTAssertTrue(UIAlertController().isBeingPresented)
            }
        }
    }
}
