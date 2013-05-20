//
//  PlacesDetailViewController.m
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "PlaceDetailViewController.h"

@interface PlaceDetailViewController ()
@end

@implementation PlaceDetailViewController {
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    PlacesTableViewController * placesVC = [[PlacesTableViewController alloc] initWithNibName:@"PlacesTableViewController" bundle:nil];
        
    [self presentViewController:placesVC animated:NO completion:nil];
    //[placesVC release];
}

@end