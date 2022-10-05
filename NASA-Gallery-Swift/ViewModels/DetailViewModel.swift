import Foundation
import UIKit

class DetailViewModel: NSObject {
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: Activity Indicator
    func displayLoadingView(imageView: UIImageView) {
        imageView.addSubview(activityIndicator)
        activityIndicator.center = imageView.convert(imageView.center, from: imageView.superview)
        activityIndicator.startAnimating()
    }

    func hideLoadingView() {
        activityIndicator.removeFromSuperview()
    }
}
