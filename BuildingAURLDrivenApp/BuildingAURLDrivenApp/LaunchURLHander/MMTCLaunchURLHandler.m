//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCLaunchURLHandler.h"

@implementation MMTCLaunchURLHandler

NSString *MMTCLaunchURLHandlerScheme = @"mmtc";
NSString *MMTCLaunchURLHandlerHost = @"localhost";
NSString *MMTCLaunchURLHandlerShowViewControllers = @"viewcontrollers";

NSString *MMTCLaunchURLHandlerShowViewControllerRed = @"red";
NSString *MMTCLaunchURLHandlerShowViewControllerBlue = @"blue";

-(BOOL)openURLPathForShowingSpecificViewController:(NSString*)path
{
    if(path == nil) return NO;
    if([path length] == 0) return NO;
    
    if([path caseInsensitiveCompare:MMTCLaunchURLHandlerShowViewControllerRed] == NSOrderedSame) {
        return YES;
    }
    
    if([path caseInsensitiveCompare:MMTCLaunchURLHandlerShowViewControllerBlue] == NSOrderedSame) {
        return YES;
    }
    
    return NO;
}

// expecting /viewcontrollers/vcname
-(BOOL)openURLPathForShowingViewControllers:(NSString*)path
{
    if(path == nil) return NO;
    if([path length] == 0) return NO;
    
    path = [path stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    
    NSArray *pathComponents = [path componentsSeparatedByString:@"/"];
    if([pathComponents count] == 0) return NO;
    
    NSString *firstPathComponent = [pathComponents firstObject];
    if([firstPathComponent caseInsensitiveCompare:MMTCLaunchURLHandlerShowViewControllers] != NSOrderedSame) return NO;

    NSString *lastPathComponent = [pathComponents lastObject];
    
    return [self openURLPathForShowingSpecificViewController:lastPathComponent];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)URL sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if(URL == nil) return NO;
    
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return NO;
    
    NSString *scheme = [components scheme];
    if([scheme caseInsensitiveCompare:MMTCLaunchURLHandlerScheme] != NSOrderedSame) return NO;
    
    NSString *host = [components host];
    if([host caseInsensitiveCompare:MMTCLaunchURLHandlerHost] != NSOrderedSame) return NO;
    
    NSString *path = [components path];
    if([self openURLPathForShowingViewControllers:path]) return YES;
    
    return NO;
}

#pragma mark - 

+(instancetype)handler
{
    return [[self alloc] init];
}

@end
