//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCHostPresenter.h"

#import "MMTCViewControllersPresenter.h"

@implementation MMTCHostPresenter

NSString *MMTCLaunchURLHandlerHost = @"localhost";

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL*)URL
{
    NSString *hostFromURL = [super hostFromURL:URL];

    return [super presenterForKey:hostFromURL URL:URL];
}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);

    NSDictionary *hostMap = @{
    MMTCLaunchURLHandlerHost : [MMTCViewControllersPresenter presenterWithNavigationController:navigationController]
    };

    self = [super initWithMap:hostMap];
    
    return self;
}

#pragma mark -

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
