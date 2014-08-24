//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCSchemePresenter.h"
#import "MMTCHostPresenter.h"
#import "MMTCMailToPresenter.h"

@implementation MMTCSchemePresenter

NSString *MMTCLaunchURLHandlerScheme = @"mmtc";
NSString *MMTCMailToScheme = @"mailto";

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL*)URL
{
    NSString *schemeFromURL = [self schemeFromURL:URL];
    
    return [self presenterForKey:schemeFromURL URL:URL];
}

#pragma mark - 

-(instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    NSParameterAssert(navigationController != nil);

    NSDictionary *schemeMap = @{
    MMTCLaunchURLHandlerScheme : [MMTCHostPresenter presenterWithNavigationController:navigationController],
    MMTCMailToScheme : [MMTCMailToPresenter presenterWithNavigationController:navigationController]
    };

    self = [super initWithMap:schemeMap];
    
    return self;
}

#pragma mark -

+(instancetype)presenterWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
