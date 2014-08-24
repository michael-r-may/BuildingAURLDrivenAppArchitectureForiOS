//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMTCPresentableProtocol;

@interface MMTCPresenterBase : NSObject

-(NSString*)schemeFromURL:(NSURL*)URL;

-(NSString*)hostFromURL:(NSURL*)URL;

-(NSArray*)pathComponentsFromURL:(NSURL*)URL;

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForKey:(NSString*)key
                                          URL:(NSURL*)URL;

#pragma mark -

-(instancetype)initWithMap:(NSDictionary*)map;

@end
