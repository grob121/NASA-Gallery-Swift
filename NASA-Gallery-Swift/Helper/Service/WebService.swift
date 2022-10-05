import Alamofire
import ObjectMapper

class WebService {
    static let shared = WebService()
    
    func getAstronomyPictureOfTheDay(callback: @escaping (Swift.Result<[Picture], Error>) -> Void) {
        let parameters: [String:Any] = [
                                        "api_key": Router.demoKey,
                                        "count": 5
                                       ]
        
        AF.request(
            Router.baseUrl,
            method: .get,
            parameters: parameters,
            encoding: URLEncoding.queryString)
            .responseString { response in

            switch response.result {
                case .success(let value):
                    guard let pictures = Mapper<Picture>().mapArray(JSONString: value) else { return }
                    callback(.success(pictures))
                case .failure(let error):
                    callback(.failure(error))
            }
        }
    }
}
