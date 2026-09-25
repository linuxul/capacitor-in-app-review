import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(InAppReviewPlugin)
public class InAppReviewPlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "InAppReviewPlugin"
    public let jsName = "InAppReview"
    public let pluginMethods: [CAPPluginMethod] = [
        .async("requestReview", InAppReviewPlugin.requestReview)
    ]
    private let implementation = InAppReview()

    /// The window scenes are UIKit state: the method runs on the main actor. It resolves once the prompt is requested.
    @MainActor
    func requestReview(_ call: CAPPluginCall) async {
        implementation.requestReview()
    }
}
