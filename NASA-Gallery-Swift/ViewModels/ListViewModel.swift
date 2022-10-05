import Foundation
import UIKit

class ListViewModel: NSObject {
    var astronomyPictures = [Picture]()
    
    // MARK: API
    func getAstronomyPictureOfTheDay(viewController: ListViewController) {
        WebService.shared.getAstronomyPictureOfTheDay { callback in
            switch callback {
                case .success(let pictures):
                    if !pictures.isEmpty {
                        self.astronomyPictures = pictures
                        viewController.collectionView.reloadData()
                    }
                case .failure(let error):
                    let alertController = UIAlertController(title:  NSLocalizedString("alert_error_title", comment: ""),
                                                            message: error.localizedDescription,
                                                            preferredStyle: .alert)
                    
                    let action = UIAlertAction(title:  NSLocalizedString("alert_ok_button", comment: ""), style: .default, handler: nil)
                    alertController.addAction(action)
                    viewController.present(alertController, animated: true)
            }
        }
    }
}
