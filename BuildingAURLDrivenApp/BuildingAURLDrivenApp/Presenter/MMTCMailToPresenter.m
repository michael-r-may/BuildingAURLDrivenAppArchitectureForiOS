//
//  Created by Developer on 2014/08/24.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <MessageUI/MessageUI.h>

#import "MMTCMailToPresenter.h"

#import "MMTCPresenter.h"
#import "MMTCPresentable.h"
#import "MMTCModalPresentable.h"

@interface MMTCMailToPresenter () <MFMailComposeViewControllerDelegate>
@property (nonatomic, weak, readonly) UINavigationController* navigationController;
@end


@implementation MMTCMailToPresenter

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    
}

#pragma mark -

-(id<MMTCPresentableProtocol>)modalMailToPresentable
{
    MMTCPushPresentableBuilder mailToBuilder = ^{
        // if ([MFMailComposeViewController canSendMail]) << if NO present an error instead
        
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] init];
//        [composeViewController setMailComposeDelegate:self];
        
        return composeViewController;
    };
    
    return [MMTCModalPresentable pushPresentableWithNavigationController:[self navigationController]
                                                                 builder:mailToBuilder];
}

#pragma mark -

-(id<MMTCPresentableProtocol>)presenterForURL:(NSURL *)URL
{
    return [self modalMailToPresentable];
}

#pragma mark -

-(instancetype)initWithNavigationController:(UINavigationController*)navigationController
{
    NSParameterAssert(navigationController != nil);
    
    self = [super init];
    
    if(self) {
        _navigationController = navigationController;
    }
    
    return self;
}

+(instancetype)presenterWithNavigationController:(UINavigationController*)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}


@end
