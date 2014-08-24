//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCSchemePresenter.h"
#import "MMTCHostPresenter.h"
#import "MMTCMailToPresenter.h"

@interface MMTCSchemePresenter ()
@property (nonatomic, strong, readonly) NSDictionary *schemeMap;
@end

@implementation MMTCSchemePresenter

NSString *MMTCLaunchURLHandlerScheme = @"mmtc";
NSString *MMTCMailToScheme = @"mailto";

-(NSString*)schemeFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;
    
    NSString *scheme = [components scheme];
    return scheme;
}

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL*)URL
{
    NSString *schemeFromURL = [self schemeFromURL:URL];
    NSDictionary *schemeMap = self.schemeMap;
    NSArray *allKnownSchemes = [schemeMap allKeys];
    
    for(NSString *scheme in allKnownSchemes) {
        if([scheme caseInsensitiveCompare:schemeFromURL] == NSOrderedSame) {
            id presenter = [schemeMap objectForKey:scheme];
            
            if([presenter conformsToProtocol:@protocol(MMTCPresenterProtocol)]) {
                return [presenter presenterForURL:URL];
            }
            
            return presenter;
        }
    }
    
    return nil;
}

#pragma mark - 

-(instancetype)initWithNavigationController:(UINavigationController *)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    self = [super init];
    
    if(self) {
        _schemeMap = @{MMTCLaunchURLHandlerScheme : [MMTCHostPresenter presenterWithNavigationController:navigationController],
                       MMTCMailToScheme : [MMTCMailToPresenter presenterWithNavigationController:navigationController]};
    }
    
    return self;
}

#pragma mark -

+(instancetype)presenterWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
