//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPushPresentable.h"

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
        [[self navigationController] popViewControllerAnimated:YES];
    });
}

@end
