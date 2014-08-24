//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPresentable.h"

@implementation MMTCPresentable

#pragma mark - 

-(void)present
{
    NSAssert(NO, @"General presentable does not know how to present anything - you need a concrete implementation of this class");
}

-(void)dismiss
{
    NSAssert(NO, @"General presentable does not know how to dismiss anything - you need a concrete implementation of this class");
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
