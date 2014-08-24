//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPushPresentable.h"

@interface MMTCPushPresentable ()
@property (nonatomic, strong, readonly) UINavigationController *navigationController;
@property (nonatomic, strong, readonly) MMTCPushPresentableBuilder builder;
@end

@implementation MMTCPushPresentable

-(void)present
{
    UIViewController* viewController = self.builder(self.navigationController);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self navigationController] pushViewController:viewController animated:YES];
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
                             builder:(MMTCPushPresentableBuilder)builder
{
    self = [super init];
    
    if(self) {
        _navigationController = navigationController;
        _builder = builder;
    }
    
    return self;
}

+(instancetype)pushPresentableWithNavigationController:(UINavigationController*)navigationController
                                               builder:(MMTCPushPresentableBuilder)builder
{
    return [[self alloc] initWithNavigationController:navigationController builder:builder];
}

@end
