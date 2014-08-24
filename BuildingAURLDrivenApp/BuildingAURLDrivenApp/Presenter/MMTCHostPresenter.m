//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCHostPresenter.h"

#import "MMTCViewControllersPresenter.h"

@interface MMTCHostPresenter ()
@property (nonatomic, strong, readonly) NSDictionary *hostMap;
@end


@implementation MMTCHostPresenter

NSString *MMTCLaunchURLHandlerHost = @"localhost";

-(NSString*)hostFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;

    NSString *host = [components host];
    return host;
}

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL*)URL
{
    NSString *hostFromURL = [self hostFromURL:URL];
    NSDictionary *hostMap = self.hostMap;
    NSArray *allKnownHosts = [hostMap allKeys];
    
    for(NSString *host in allKnownHosts) {
        if([host caseInsensitiveCompare:hostFromURL] == NSOrderedSame) {
            id presenter = [hostMap objectForKey:host];
            
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
        _hostMap = @{MMTCLaunchURLHandlerHost : [MMTCViewControllersPresenter presenterWithNavigationController:navigationController]};
    }
    
    return self;
}

#pragma mark -

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
