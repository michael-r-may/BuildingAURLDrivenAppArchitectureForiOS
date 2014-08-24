//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCLaunchURLTrigger.h"

@implementation MMTCLaunchURLTrigger

+(void)startMailTo
{
    NSURL *mailToURL = [NSURL URLWithString:@"mailto:"];
    
    [[[UIApplication sharedApplication] delegate] application:[UIApplication sharedApplication]
                                                      openURL:mailToURL
                                            sourceApplication:@""
                                                   annotation:nil];
}

@end
