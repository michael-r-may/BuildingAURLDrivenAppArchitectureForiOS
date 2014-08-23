//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCAppDelegate.h"

#import "MMTCLaunchURLHandler.h"

@interface MMTCAppDelegate ()
@property (nonatomic, strong, readonly) MMTCLaunchURLHandler *launchURLHandler;
@end

@implementation MMTCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

// now deprecated, do not use
//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

// Return YES if the delegate successfully handled the request or NO if the attempt to open the URL resource failed.
// See https://developer.apple.com/library/ios/featuredarticles/iPhoneURLScheme_Reference/Introduction/Introduction.html
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [[self launchURLHandler] application:application
                                        openURL:url
                              sourceApplication:sourceApplication
                                     annotation:annotation];
}

-(instancetype)init
{
    self = [super init];
    
    if(self) {
        _launchURLHandler = [MMTCLaunchURLHandler handler];
    }
    
    return self;
}

@end
