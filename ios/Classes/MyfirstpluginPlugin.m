#import "MyfirstpluginPlugin.h"
#if __has_include(<myfirstplugin/myfirstplugin-Swift.h>)
#import <myfirstplugin/myfirstplugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "myfirstplugin-Swift.h"
#endif

@implementation MyfirstpluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMyfirstpluginPlugin registerWithRegistrar:registrar];
}
@end
