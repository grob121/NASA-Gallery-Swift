import XCTest
@testable import NASA_Gallery_Swift

class PictureTests: XCTestCase {
    func testObjectMapper() {
        XCTAssertEqual(MockData.pictures?[0].imageUrl, "https://apod.nasa.gov/apod/image/0304/bird_tasca.jpg")
        XCTAssertEqual(MockData.pictures?[0].title, "A New Constellation Takes Hold")
        XCTAssertEqual(MockData.pictures?[0].imageDate, "2003-04-01")
        XCTAssertEqual(MockData.pictures?[0].hdurl, "https://apod.nasa.gov/apod/image/0304/bird_tasca_big.jpg")
        XCTAssertEqual(MockData.pictures?[0].explanation, "A new constellation has taken hold of the sky, much to the surprise of many sky gazers.  The constellation of Ollie the Owl has suddenly started dominating the southern hemisphere, as shown above.  The constellation is taking the place of Wrinkles the Rhinoceros, who was unexpectedly voted off the sky by the other constellations.  Happy April Fools day from the folks at APOD!  Pictured above, a bird was photographed taking the Tololo All Sky Camera (TASCA) as a perch, a situation that would be even funnier if the bird's talons hadn't scratched the plastic enclosing dome.  TASCA continues to monitor the entire night sky as visible from the Cerro Tololo Inter-american Observatory located in Chile.  Given the unusual vantage point, one guess is that the bird is a Great Horned Owl, although it is hoped that a properly under-schooled ornithologist can e-mail Dr. Schwarz with the bird's true species.")
    }
}
