//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCViewControllersPresenter.h"

#import "MMTCColouredViewController+Builder.h"
#import "MMTCPushPresentable.h"

@implementation MMTCViewControllersPresenter

NSString *MMTCLaunchURLHandlerShowViewControllerRed = @"red";
NSString *MMTCLaunchURLHandlerShowViewControllerBlue = @"blue";

-(id<MMTCPresentableProtocol>)pushRedPresentableWithNavigationController:(UINavigationController*)navigationController
{
    MMTCPushPresentableBuilder redBuilder = ^{
        return [MMTCColouredViewController controllerWithRedBackgroundColor];
    };
    
    return [MMTCPushPresentable pushPresentableWithNavigationController:navigationController
                                                                builder:redBuilder];
}

-(id<MMTCPresentableProtocol>)pushBluePresentableWithNavigationController:(UINavigationController*)navigationController
{
    MMTCPushPresentableBuilder blueBuilder = ^{
        return [MMTCColouredViewController controllerWithBlueBackgroundColor];
    };
    
    return [MMTCPushPresentable pushPresentableWithNavigationController:navigationController
                                                                builder:blueBuilder];

}

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL *)URL
{
    NSArray *pathComponentsFromURL = [super pathComponentsFromURL:URL];
    NSString *lastPathComponent = [pathComponentsFromURL lastObject];
    
    return [super presenterForKey:lastPathComponent URL:URL];
}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);

    NSDictionary *pathMap = @{MMTCLaunchURLHandlerShowViewControllerRed : [self pushRedPresentableWithNavigationController:navigationController],
                              MMTCLaunchURLHandlerShowViewControllerBlue : [self pushBluePresentableWithNavigationController:navigationController]};

    
    self = [super initWithMap:pathMap];
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
