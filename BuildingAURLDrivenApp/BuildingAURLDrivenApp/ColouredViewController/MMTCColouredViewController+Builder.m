//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCColouredViewController+Builder.h"

@implementation MMTCColouredViewController (Builder)

+(instancetype)controllerWithRedBackgroundColor
{
    UIColor *redColor = [UIColor redColor];
    MMTCColouredViewController *controller = [[MMTCColouredViewController alloc] initWithBackgroundColor:redColor];
    
    return controller;
}

+(instancetype)controllerWithBlueBackgroundColor
{
    UIColor *blueColor = [UIColor blueColor];
    MMTCColouredViewController *controller = [[MMTCColouredViewController alloc] initWithBackgroundColor:blueColor];
    
    return controller;
}

@end
