#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(WidgetsBridgePluginPlugin, "WidgetsBridgePlugin",
           CAP_PLUGIN_METHOD(getItem, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(setItem, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(removeItem, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(reloadAllTimelines, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(reloadTimelines, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getCurrentConfigurations, CAPPluginReturnPromise);
)
