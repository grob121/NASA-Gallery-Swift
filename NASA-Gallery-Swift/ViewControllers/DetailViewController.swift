import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pictureTitle: UILabel!
    @IBOutlet weak var pictureExplanation: UILabel!
    
    var viewModel = DetailViewModel()
    var pictureDetail: Picture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.displayLoadingView(imageView: pictureImageView)
        
        DispatchQueue.global(qos: .background).async {
            guard let imageUrlString = self.pictureDetail.hdurl,
                  let imageUrl = URL(string: imageUrlString) else { return }
            
            do {
                let imageData = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    self.viewModel.hideLoadingView()
                    self.pictureImageView.image = UIImage(data: imageData)
                }
            } catch {
               return
            }
        }
        
        pictureTitle.text = pictureDetail.title
        pictureExplanation.text = pictureDetail.explanation
    }
}
