//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCModalPresentable.h"

@implementation MMTCModalPresentable

-(void)present
{
    UIViewController* viewController = self.builder(self.navigationController);
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self navigationController] presentViewController:viewController animated:YES completion:nil];
    });
}

-(void)dismiss
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self navigationController] dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
