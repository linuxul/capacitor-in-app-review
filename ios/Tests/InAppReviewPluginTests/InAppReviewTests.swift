import XCTest
@testable import InAppReviewPlugin

class InAppReviewTests: XCTestCase {
    func testPluginIsBridgedUnderItsJavaScriptName() {
        let plugin = InAppReviewPlugin()

        XCTAssertEqual(plugin.identifier, "InAppReviewPlugin")
        XCTAssertEqual(plugin.jsName, "InAppReview")
        XCTAssertEqual(plugin.pluginMethods.map(\.name), ["requestReview"])
    }
}
