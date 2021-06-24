import Foundation

@objc public class WidgetsBridgePlugin: NSObject {
    @objc public func echo(_ value: String) -> String {
        return value
    }
}
