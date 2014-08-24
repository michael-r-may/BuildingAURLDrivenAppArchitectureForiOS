//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCPresenterBase.h"
#import "MMTCPresenterProtocol.h"

@interface MMTCPresenterBase ()
@property (nonatomic, strong, readonly) NSDictionary *map;
@end

@implementation MMTCPresenterBase

#pragma mark - URL handling

-(NSString*)schemeFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;
    
    NSString *scheme = [components scheme];
    return scheme;
}

-(NSString*)hostFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;
    
    NSString *host = [components host];
    return host;
}

-(NSArray*)pathComponentsFromURL:(NSURL*)URL
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:URL resolvingAgainstBaseURL:NO];
    if(components == nil) return nil;
    
    NSString *path = [components path];
    
    path = [path stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/"]];
    
    NSArray *pathComponents = [path componentsSeparatedByString:@"/"];
    
    return pathComponents;
}

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForKey:(NSString*)key
                                          URL:(NSURL*)URL
{
    NSArray *allKnownKeys = [[self map] allKeys];
    
    for(NSString *knownKey in allKnownKeys) {
        if([knownKey caseInsensitiveCompare:key] == NSOrderedSame) {
            id presenter = [[self map] objectForKey:knownKey];
            
            if([presenter conformsToProtocol:@protocol(MMTCPresenterProtocol)]) {
                return [presenter presenterForURL:URL];
            }
            
            return presenter;
        }
    }
    
    return nil;
}

#pragma mark - 

-(NSString*)description
{
    return [NSString stringWithFormat:@"%@, map:%@", [super description], [self map]];
}

#pragma mark - 

-(instancetype)initWithMap:(NSDictionary*)map
{
    NSParameterAssert(map != nil);
    
    self = [super init];
    
    if(self) {
        _map = [map copy];
    }
    
    return self;
}

@end
