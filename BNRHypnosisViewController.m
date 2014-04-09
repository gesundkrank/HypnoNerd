//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Jan Grassegger on 09.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //Create a UIImage from a file
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        self.tabBarItem.image = i;
    }
    
    return self;
}

- (void)loadView
{
    //Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    //Set it as *the* view of this controller
    self.view = backgroundView;
}

@end
