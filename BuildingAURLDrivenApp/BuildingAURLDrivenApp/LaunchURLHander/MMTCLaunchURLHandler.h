//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//
//  Don't forget to register your URL scheme(s) in the Info.plist

#import <Foundation/Foundation.h>

@class UIApplication;
@class MMTCPresenter;

@interface MMTCLaunchURLHandler : NSObject

-(BOOL)openURL:(NSURL *)url
 sourceApplication:(NSString *)sourceApplication
        annotation:(id)annotation;

+(instancetype)handlerWithPresenter:(MMTCPresenter*)presenter;

@end
