//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <XCTest/XCTest.h>

#import "MMTCLaunchURLHandler.h"

#import "MMTCPresenter.h"
#import "MMTCSchemePresenter.h"
#import "MMTCHostPresenter.h"
#import "MMTCViewControllersPresenter.h"

@interface MMTCLaunchURLHandlerTests : XCTestCase

@end

@implementation MMTCLaunchURLHandlerTests

-(void)testTryingToHandleANilURLReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    NSURL *URLToHandle = nil;
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnEmptyURLReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];
    
    NSURL *URLToHandle = [[NSURL alloc] init];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithTheWrongSchemeReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];
    
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:@"myscheme" host:@"10.0.0.128" path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithTheWrongHostReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:@"10.0.0.128" path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithAnUnknownPathReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAURLWithAnEmptyPathReturnsNO
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    BOOL expectedResult = NO;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}


-(void)testTryingToHandleARedURLWithAKnownPathReturnsYES
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontrollers/red"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    BOOL expectedResult = YES;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}

-(void)testTryingToHandleABlueURLWithAKnownPathReturnsYES
{
    // given
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    MMTCPresenter *presenter = [MMTCPresenter presenterWithNavigationController:navigationController];
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handlerWithPresenter:presenter];

    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontrollers/red"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler openURL:URLToHandle
                     sourceApplication:sourceApplication
                            annotation:annotation];
    
    // then
    BOOL expectedResult = YES;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}

@end
