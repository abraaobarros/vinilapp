//
//  FirstViewController.m
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
    @property (nonatomic,weak) IBOutlet UIImageView *logo;
@end

@implementation FirstViewController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGRect logoFrame = self.logo.frame;
    logoFrame.origin.y = -logoFrame.size.height;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelay:1.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    
    self.logo.frame = logoFrame;
    
    [UIView commitAnimations];
}

@end

