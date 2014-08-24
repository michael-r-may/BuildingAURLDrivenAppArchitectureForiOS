//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPathPresenter.h"
#import "MMTCViewControllersPresenter.h"

@interface MMTCPathPresenter ()
@property (nonatomic, strong, readonly) NSDictionary *pathMap;
@end

@implementation MMTCPathPresenter

NSString *MMTCLaunchURLHandlerShowViewControllers = @"viewcontrollers";

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
    NSString *firstPathComponent = [pathComponentsFromURL firstObject];
    
    NSDictionary *pathMap = self.pathMap;
    NSArray *allKnownPaths = [pathMap allKeys];
    
    for(NSString *path in allKnownPaths) {
        if([path caseInsensitiveCompare:firstPathComponent] == NSOrderedSame) {
            id presenter = [pathMap objectForKey:path];
            
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
        _pathMap = @{MMTCLaunchURLHandlerShowViewControllers: [MMTCViewControllersPresenter presenterWithNavigationController:navigationController]};
    }
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
