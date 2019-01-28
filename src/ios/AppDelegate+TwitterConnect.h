#import "AppDelegate.h"
#import <Twitter/Twitter.h>

@interface AppDelegate (TwitterConnect)
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options;

@end
