//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MMTCLaunchURLHandler.h"

@interface MMTCLaunchURLHandlerTests : XCTestCase

@end

@implementation MMTCLaunchURLHandlerTests

-(void)testTryingToHandleANilURLReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = nil;
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnEmptyURLReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] init];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithTheWrongSchemeReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:@"myscheme" host:@"10.0.0.128" path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithTheWrongHostReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:@"10.0.0.128" path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAnURLWithAnUnknownPathReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontroller/one"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    XCTAssertFalse(wasHandled, @"");
}

-(void)testTryingToHandleAURLWithAnEmptyPathReturnsNO
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    BOOL expectedResult = NO;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}


-(void)testTryingToHandleARedURLWithAKnownPathReturnsYES
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontrollers/red"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    BOOL expectedResult = YES;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}

-(void)testTryingToHandleABlueURLWithAKnownPathReturnsYES
{
    // given
    MMTCLaunchURLHandler* handler = [MMTCLaunchURLHandler handler];
    id application = nil;
    NSURL *URLToHandle = [[NSURL alloc] initWithScheme:MMTCLaunchURLHandlerScheme host:MMTCLaunchURLHandlerHost path:@"/viewcontrollers/red"];
    NSString *sourceApplication = @"MMTCLaunchURLHandlerTests";
    id annotation = nil;
    
    // when
    BOOL wasHandled = [handler application:application
                                   openURL:URLToHandle
                         sourceApplication:sourceApplication
                                annotation:annotation];
    
    // then
    BOOL expectedResult = YES;
    XCTAssertEqual(wasHandled, expectedResult, @"");
}

@end
