import XCTest
import Capacitor
@testable import InAppReviewPlugin

class InAppReviewTests: XCTestCase {
    func testPluginIsBridgedUnderItsJavaScriptName() {
        let plugin = InAppReviewPlugin()

        XCTAssertEqual(plugin.identifier, "InAppReviewPlugin")
        XCTAssertEqual(plugin.jsName, "InAppReview")
        XCTAssertEqual(plugin.pluginMethods.map(\.name), ["requestReview"])
        XCTAssertEqual(plugin.pluginMethods.map(\.returnType), [.promise])
    }

    @MainActor
    func testRequestReviewLeavesTheAnswerToTheBridge() async {
        let call = CAPPluginCall(callbackId: "test", methodName: "requestReview", options: [:], success: { _, _ in
            XCTFail("requestReview answers by returning")
        }, error: { _ in
            XCTFail("requestReview answers by returning")
        })

        // The test runner has no active window scene, so StoreKit is not asked; the bridge resolves the call when the
        // method returns.
        await InAppReviewPlugin().requestReview(call)
    }
}
