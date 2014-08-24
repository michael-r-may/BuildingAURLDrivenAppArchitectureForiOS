//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCViewController.h"

#import "MMTCLaunchURLTrigger.h"

@implementation MMTCViewController

-(IBAction)sendEmailButtonPressed:(id)sender
{
    [MMTCLaunchURLTrigger startMailTo];
}

-(IBAction)lanchRedViewController:(id)sender
{
    [MMTCLaunchURLTrigger launchRedViewController];
}

-(IBAction)lanchBlueViewController:(id)sender
{
    [MMTCLaunchURLTrigger launchBlueViewController];
}

#pragma mark -

-(instancetype)init
{
    self = [super initWithNibName:@"MMTCViewController" bundle:nil];
    
    return self;
}

#pragma mark - 

+(instancetype)controller
{
    return [[self alloc] init];
}

@end
