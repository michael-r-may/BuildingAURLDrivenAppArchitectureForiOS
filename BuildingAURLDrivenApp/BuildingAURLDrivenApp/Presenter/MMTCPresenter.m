//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPresenter.h"

#import "MMTCColouredViewController+Builder.h"

@interface MMTCPresenter ()
@property (nonatomic, weak, readonly) UINavigationController* navigationController;
@end

@implementation MMTCPresenter

-(void)pushRedController
{
    UIViewController *redController = [MMTCColouredViewController controllerWithRedBackgroundColor];
    
    [[self navigationController] pushViewController:redController animated:YES];
}

-(void)pushBlueController
{
    UIViewController *blueController = [MMTCColouredViewController controllerWithBlueBackgroundColor];
    
    [[self navigationController] pushViewController:blueController animated:YES];
}

#pragma mark - 

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    self = [super init];
    
    if(self) {
        _navigationController = navigationController;
    }
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
