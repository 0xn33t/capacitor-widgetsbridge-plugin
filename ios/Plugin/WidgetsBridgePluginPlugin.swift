import Foundation
import Capacitor
import WidgetKit


@objc(WidgetsBridgePluginPlugin)
public class WidgetsBridgePluginPlugin: CAPPlugin {

    @objc func setItem(_ call: CAPPluginCall) {
        guard let key = call.getString("key") else {
            call.reject("Key must be provided")
            return
        }
        
        guard let value = call.getString("value") else {
            call.reject("Value must be provided")
            return
        }
        
        guard let group = call.getString("group") else {
            call.reject("Group must be provided")
            return
        }
        
        if let userDefaults = UserDefaults.init(suiteName: group) {
            userDefaults.set(value, forKey: key)
            call.resolve(["results": true])
            return
        }
        
        call.reject("Could not set item")
    }
    
    @objc func getItem(_ call: CAPPluginCall) {
        guard let key = call.getString("key") else {
            call.reject("Key must be provided")
            return
        }
        
        guard let group = call.getString("group") else {
            call.reject("Group must be provided")
            return
        }
        
        if let userDefaults = UserDefaults.init(suiteName: group) {
            let value = userDefaults.value(forKey: key)
            if value != nil {
                call.resolve(["results": value!])
                return
            }
        }
        
        call.reject("Could not get item")
    }
    
    @objc func removeItem(_ call: CAPPluginCall) {
        guard let key = call.getString("key") else {
            call.reject("Key must be provided")
            return
        }
        
        guard let group = call.getString("group") else {
            call.reject("Group must be provided")
            return
        }
        
        if let userDefaults = UserDefaults.init(suiteName: group) {
            userDefaults.removeObject(forKey: key)
            call.resolve(["results": true])
            return
        }
        
        call.reject("Could not remove item")
    }
    
    @objc func reloadAllTimelines(_ call: CAPPluginCall) {
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
            call.resolve(["results": true])
        } else {
            call.unavailable("Not available in iOS 13 or earlier.")
        }
    }
    
    @objc func reloadTimelines(_ call: CAPPluginCall) {
        guard let ofKind = call.getString("ofKind") else {
            call.reject("ofKind must be provided")
            return
        }
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
            call.resolve(["results": true])
        } else {
            call.unavailable("Not available in iOS 13 or earlier.")
        }
    }
    
}
