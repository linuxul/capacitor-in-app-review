import Foundation
import StoreKit
import UIKit

@objc public class InAppReview: NSObject {
    /// Asks StoreKit to show the review prompt in the active window scene. StoreKit decides whether it appears and does
    /// not report it, so this returns right away.
    @MainActor
    func requestReview() {
        if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            AppStore.requestReview(in: windowScene)
        }
    }
}
