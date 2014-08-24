//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMTCPresentableProtocol.h"

@interface MMTCPushPresentable : NSObject <MMTCPresentableProtocol>

+(instancetype)pushPresentableWithNavigationController:(UINavigationController*)navigationController
                                        viewController:(UIViewController*)viewController;

@end
