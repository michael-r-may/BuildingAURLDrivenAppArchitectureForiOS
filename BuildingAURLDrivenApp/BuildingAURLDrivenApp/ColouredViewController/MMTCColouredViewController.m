//
//  Created by Developer on 2014/08/23.
//  Copyright (c) 2014 Michael May & Tim Chilvers. All rights reserved.
//

#import "MMTCColouredViewController.h"

@interface MMTCColouredViewController ()
@property (nonatomic, strong, readonly) UIColor *backgroundColor;
@end

@implementation MMTCColouredViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[self backgroundColor]];
}

#pragma mark -

-(instancetype)initWithBackgroundColor:(UIColor*)backgroundColor
{
    NSParameterAssert(backgroundColor != nil);
    
    self = [super initWithNibName:nil bundle:nil];
    
    if(self) {
        _backgroundColor = backgroundColor;
    }
    
    return self;
}


@end
