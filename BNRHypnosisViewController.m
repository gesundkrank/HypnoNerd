//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Jan Grassegger on 09.04.14.
//  Copyright (c) 2014 Jan Graßegger. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController ()

@property (nonatomic, weak) BNRHypnosisView *hypnosisView;

@end

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
    [backgroundView.segmentedControl addTarget:self action:@selector(touchSegmentControl:) forControlEvents:UIControlEventValueChanged];
    self.view = backgroundView;
    self.hypnosisView = backgroundView;
}

- (void)touchSegmentControl:(id) sender
{
    int index = [sender selectedSegmentIndex];
    UIColor *newColor;
    switch (index) {
        case 0:
            newColor = [UIColor redColor];
            break;
        case 1:
            newColor = [UIColor greenColor];
            break;
        case 2:
            newColor = [UIColor blueColor];
            break;
            
        default:
            newColor = [UIColor grayColor];
            break;
    }
    self.hypnosisView.circleColor = newColor;
}

@end
