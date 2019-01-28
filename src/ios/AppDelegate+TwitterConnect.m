//
//  AppDelegate+TwitterConnect.m
//  Twitter Login
//
//  Created by nrikiji inc on 2017/09/01.
//
//

#import "AppDelegate+TwitterConnect.h"
#import <objc/runtime.h>
#import <TwitterKit/TwitterKit.h>

@implementation AppDelegate (TwitterConnect)

static void swizzleMethod(Class class, SEL destinationSelector, SEL sourceSelector);

+(void)load {
    swizzleMethod([AppDelegate class],
                  @selector(application:openURL:options:),
                  @selector(twitter_application_options:openURL:options:));
}

- (BOOL)twitter_application_options: (UIApplication *)app
                         openURL: (NSURL *)url
                         options: (NSDictionary *)options
{
    NSRange range = [url.absoluteString rangeOfString:@"twitterkit"];
    if (range.location != NSNotFound) {
        return [[Twitter sharedInstance] application:app openURL:url options:options];
    } else {
        return [self twitter_application_options:app openURL:url options:options];
    }
}

static void swizzleMethod(Class class, SEL destinationSelector, SEL sourceSelector) {
    Method destinationMethod = class_getInstanceMethod(class, destinationSelector);
    Method sourceMethod = class_getInstanceMethod(class, sourceSelector);
    
    if (class_addMethod(class, destinationSelector, method_getImplementation(sourceMethod), method_getTypeEncoding(sourceMethod))) {
        class_replaceMethod(class, destinationSelector, method_getImplementation(destinationMethod), method_getTypeEncoding(destinationMethod));
    } else {
        method_exchangeImplementations(destinationMethod, sourceMethod);
    }
}

@end
