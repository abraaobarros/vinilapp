//
//  ProfileViewController.m
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import "ProfileViewController.h"
#import "MusicTableViewController.h"
#import "PlaylistTableViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad {
    restaurantNameLabel.text = _restaurantName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowMusicList"]) {
        MusicTableViewController *vc = [segue destinationViewController];
        vc.restaurantId = _restaurantId;
    } else if ([segue.identifier isEqualToString:@"ShowPlaylist"]) {
        PlaylistTableViewController *vc = [segue destinationViewController];
        vc.restaurantId = _restaurantId;
    }
}

@end