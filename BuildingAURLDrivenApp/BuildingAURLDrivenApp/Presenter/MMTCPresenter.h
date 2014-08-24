//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MMTCPresenterProtocol.h"

// this is the root, just call presenterForURL: to get back a presentable which
// can then be shown with present
@interface MMTCPresenter : NSObject <MMTCPresenterProtocol>


@end
