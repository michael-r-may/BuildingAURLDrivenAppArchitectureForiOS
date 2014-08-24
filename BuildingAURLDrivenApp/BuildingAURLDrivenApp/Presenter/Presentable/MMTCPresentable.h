//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMTCPresentableProtocol.h"


typedef UIViewController* (^MMTCPushPresentableBuilder)();


@interface MMTCPresentable : NSObject <MMTCPresentableProtocol>

@property (nonatomic, strong, readonly) UINavigationController *navigationController;
@property (nonatomic, strong, readonly) MMTCPushPresentableBuilder builder;

+(instancetype)pushPresentableWithNavigationController:(UINavigationController*)navigationController
                                               builder:(MMTCPushPresentableBuilder)builder;

@end
