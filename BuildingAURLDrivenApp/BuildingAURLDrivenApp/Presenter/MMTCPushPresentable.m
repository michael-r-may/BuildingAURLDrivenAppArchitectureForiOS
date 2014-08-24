//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPushPresentable.h"

@interface MMTCPushPresentable ()
@property (nonatomic, strong, readonly) UINavigationController *navigationController;
@property (nonatomic, strong, readonly) UIViewController* viewController;
@end

@implementation MMTCPushPresentable

-(void)present
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self navigationController] pushViewController:[self viewController] animated:YES];
    });
}

-(void)dismiss
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self navigationController] dismissViewControllerAnimated:YES completion:nil];
    });
}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
                             viewController:(UIViewController*)viewController
{
    self = [super init];
    
    if(self) {
        _navigationController = navigationController;
        _viewController = viewController;
    }
    
    return self;
}

+(instancetype)pushPresentableWithNavigationController:(UINavigationController*)navigationController
                                        viewController:(UIViewController*)viewController
{
    return [[self alloc] initWithNavigationController:navigationController viewController:viewController];
}

@end
