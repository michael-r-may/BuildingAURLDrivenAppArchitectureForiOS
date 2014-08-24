//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MMTCPresentableProtocol;

@protocol MMTCPresenterProtocol <NSObject>
@required

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL*)URL;

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController;

@end
