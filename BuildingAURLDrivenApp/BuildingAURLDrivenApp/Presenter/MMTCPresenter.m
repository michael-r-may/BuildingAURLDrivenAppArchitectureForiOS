//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPresenter.h"

#import "MMTCSchemePresenter.h"

@interface MMTCPresenter ()
@property (nonatomic, strong, readonly) NSArray *topLevelPresenters;
@end

@implementation MMTCPresenter

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL *)URL
{
    for(MMTCPresenter* topLevelPresenter in self.topLevelPresenters) {
        id presenter = [topLevelPresenter presenterForURL:URL];
        if(presenter) return presenter;
    }
    
    return nil;
}

#pragma mark - 

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    self = [super init];
    
    if(self) {
        _topLevelPresenters = @[[MMTCSchemePresenter presenterWithNavigationController:navigationController]];
    }
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
