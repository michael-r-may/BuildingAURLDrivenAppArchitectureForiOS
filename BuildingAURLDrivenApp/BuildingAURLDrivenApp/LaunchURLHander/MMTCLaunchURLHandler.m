//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCLaunchURLHandler.h"
#import "MMTCPresenter.h"
#import "MMTCPresentableProtocol.h"

@interface MMTCLaunchURLHandler ()
@property (nonatomic, strong, readonly) NSDictionary *pathRootMap;
@property (nonatomic, strong, readonly) MMTCPresenter *presenter;
@end

@implementation MMTCLaunchURLHandler

-(BOOL)openURL:(NSURL *)URL
sourceApplication:(NSString *)sourceApplication
    annotation:(id)annotation
{
    id<MMTCPresentableProtocol> presentable = [[self presenter] presenterForURL:URL];
    
    if(presentable) {
        [presentable present];
        return YES;
    }
    
    NSLog(@"Could not handle URL: %@", URL);
    
    return NO;
}

#pragma mark - 

-(instancetype)initWithPresenter:(MMTCPresenter*)presenter
{
    NSParameterAssert(presenter != nil);
    
    self = [super init];
    
    if(self) {
        _presenter = presenter;
    }
    
    return self;
}

+(instancetype)handlerWithPresenter:(MMTCPresenter*)presenter
{
    return [[self alloc] initWithPresenter:presenter];
}

@end
