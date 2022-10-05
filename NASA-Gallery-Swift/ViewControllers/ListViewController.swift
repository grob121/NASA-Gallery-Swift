import UIKit

class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        viewModel.getAstronomyPictureOfTheDay(viewController: self)
    }
    
    // MARK: CollectionView Delegate, Datasource
    func setUpCollectionView() {
        collectionView.register(UINib(nibName: "PictureCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "pictureCell")
        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: config)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.astronomyPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pictureCell", for: indexPath) as! PictureCollectionViewCell
        
        DispatchQueue.global(qos: .background).async {
            guard let imageUrlString = self.viewModel.astronomyPictures[indexPath.item].imageUrl,
                  let imageUrl = URL(string: imageUrlString) else { return }
            
            do {
               let imageData = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    cell.activityIndicator.stopAnimating()
                    cell.pictureImageView.image = UIImage(data: imageData)
                }
            } catch {
               return
            }
        }
        
        cell.pictureTitle.text = viewModel.astronomyPictures[indexPath.item].title
        cell.pictureDate.text = viewModel.astronomyPictures[indexPath.item].imageDate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        controller.pictureDetail = viewModel.astronomyPictures[indexPath.item]
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
