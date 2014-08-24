//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPathPresenter.h"
#import "MMTCViewControllersPresenter.h"

@implementation MMTCPathPresenter

NSString *MMTCLaunchURLHandlerShowViewControllers = @"viewcontrollers";

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL *)URL
{
    NSArray *pathComponentsFromURL = [self pathComponentsFromURL:URL];
    NSString *firstPathComponent = [pathComponentsFromURL firstObject];

    return [super presenterForKey:firstPathComponent URL:URL];
}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    NSDictionary* pathMap = @{
    MMTCLaunchURLHandlerShowViewControllers: [MMTCViewControllersPresenter presenterWithNavigationController:navigationController]
    };

    self = [super initWithMap:pathMap];
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
