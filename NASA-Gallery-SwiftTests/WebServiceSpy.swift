import Foundation
import ObjectMapper
@testable import NASA_Gallery_Swift

enum CustomError: Error {
    case invalidToken
    case notFound
    case unexpected
}

class WebServiceSpy: WebService {
    func getAstronomyPictureOfTheDaySuccess(callback: @escaping (Swift.Result<[Picture], Error>) -> Void) {
        let pictures = Mapper<Picture>().mapArray(JSONObject: MockData.pictures) ?? []
        callback(.success(pictures))
    }
    
    func getAstronomyPictureOfTheDayFail(callback: @escaping (Swift.Result<[Picture], Error>) -> Void) {
        callback(.failure(CustomError.invalidToken))
    }
}
