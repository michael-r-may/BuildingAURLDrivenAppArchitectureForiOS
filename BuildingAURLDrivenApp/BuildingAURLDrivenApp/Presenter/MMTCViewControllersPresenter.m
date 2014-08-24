//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCViewControllersPresenter.h"

#import "MMTCColouredViewController+Builder.h"
#import "MMTCPushPresentable.h"

@interface MMTCViewControllersPresenter ()
@property (nonatomic, strong, readonly) NSDictionary *pathMap;
@property (nonatomic, weak, readonly) UINavigationController* navigationController;
@end

@implementation MMTCViewControllersPresenter

NSString *MMTCLaunchURLHandlerShowViewControllerRed = @"red";
NSString *MMTCLaunchURLHandlerShowViewControllerBlue = @"blue";

-(id<MMTCPresentableProtocol>)pushRedController
{
    UIViewController *redController = [MMTCColouredViewController controllerWithRedBackgroundColor];
 
    return [MMTCPushPresentable pushPresentableWithNavigationController:[self navigationController]
                                                          viewController:redController];
}

-(id<MMTCPresentableProtocol>)pushBlueController
{
    UIViewController *redController = [MMTCColouredViewController controllerWithRedBackgroundColor];
    
    return [MMTCPushPresentable pushPresentableWithNavigationController:[self navigationController]
                                                         viewController:redController];
}

#pragma mark -

-(NSArray*)pathComponentsFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;
    
    NSString *path = [components path];
    
    path = [path stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    
    NSArray *pathComponents = [path componentsSeparatedByString:@"/"];
    
    return pathComponents;
}

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL *)URL
{
    NSArray *pathComponentsFromURL = [self pathComponentsFromURL:URL];
    NSString *lastPathComponent = [pathComponentsFromURL lastObject];
    
    NSDictionary *pathMap = self.pathMap;
    NSArray *allKnownPaths = [pathMap allKeys];
    
    for(NSString *host in allKnownPaths) {
        if([host caseInsensitiveCompare:lastPathComponent] == NSOrderedSame) {
            id presenter = [pathMap objectForKey:host];
            
            if([presenter conformsToProtocol:@protocol(MMTCPresenterProtocol)]) {
                return [presenter presenterForURL:URL];
            }
            
            return presenter;
        }
    }
    
    return nil;

}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    self = [super init];
    
    if(self) {
        _navigationController = navigationController;
        
        _pathMap = @{MMTCLaunchURLHandlerShowViewControllerRed : [self pushRedController],
                     MMTCLaunchURLHandlerShowViewControllerBlue : [self pushBlueController]};
    }
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
