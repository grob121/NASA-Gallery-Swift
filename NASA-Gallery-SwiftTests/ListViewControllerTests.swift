import XCTest
@testable import NASA_Gallery_Swift

class ListViewControllerTests: XCTestCase {
    var sut: ListViewController?
    var collectionView: UICollectionView?
    var dataSource: UICollectionViewDataSource?
    var delegate: UICollectionViewDelegate?
    var navigationController: UINavigationController?
    
    override func setUp() {
        super.setUp()
        
        navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController
        sut = navigationController?.topViewController as? ListViewController
        sut?.loadViewIfNeeded()
        
        collectionView = sut?.collectionView
        delegate = collectionView?.delegate
        dataSource = collectionView?.dataSource
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCollectionViewCell() {
        let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
    }
    
    func testCollectionViewDelegateConformance() {
        XCTAssertTrue(collectionView?.delegate === sut)
    }
    
    func testCollectionViewDataSourceConformance() {
        XCTAssertTrue(collectionView?.dataSource === sut)
    }
    
    func testCollectionViewCellContent() {
        sut?.viewModel.astronomyPictures = MockData.pictures ?? []
        
        let cell = dataSource?.collectionView(collectionView ?? UICollectionView(), cellForItemAt: IndexPath(row: 0, section: 0)) as? PictureCollectionViewCell

        XCTAssertEqual(cell?.pictureImageView.image == nil, cell?.activityIndicator.isAnimating)
        XCTAssertEqual(cell?.pictureTitle.text, sut?.viewModel.astronomyPictures[0].title)
        XCTAssertEqual(cell?.pictureDate.text, sut?.viewModel.astronomyPictures[0].imageDate)
    }
    
    func testNumberOfItems() {
        sut?.viewModel.astronomyPictures = MockData.pictures ?? []
        
        dataSource?.collectionView(collectionView ?? UICollectionView(), numberOfItemsInSection: 0)
        XCTAssertEqual(collectionView?.numberOfItems(inSection: 0), sut?.viewModel.astronomyPictures.count)
    }
}
