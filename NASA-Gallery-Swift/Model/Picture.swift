import ObjectMapper

public struct Picture: Mappable {
    public var copyright: String?
    public var imageDate: String?
    public var explanation: String?
    public var hdurl: String?
    public var mediaType: String?
    public var serviceVersion: String?
    public var title: String?
    public var imageUrl: String?
    
    public init?(map: Map) {}
    
    mutating public func mapping(map: Map) {
        copyright        <- map["copyright"]
        imageDate        <- map["date"]
        explanation      <- map["explanation"]
        hdurl            <- map["hdurl"]
        mediaType        <- map["media_type"]
        serviceVersion   <- map["service_version"]
        title            <- map["title"]
        imageUrl         <- map["url"]
    }
}
