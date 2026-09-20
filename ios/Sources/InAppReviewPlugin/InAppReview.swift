import Foundation
import Capacitor
import StoreKit
import UIKit

@objc public class InAppReview: NSObject {
    @objc func requestReview(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                AppStore.requestReview(in: windowScene)
            }
        }
        call.resolve()
    }
}
