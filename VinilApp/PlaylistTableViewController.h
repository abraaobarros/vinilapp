//
//  PlaylistTableViewController.h
//  VinilApp
//
//  Created by Abraao Barros Laceda on 16/04/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaylistTableViewController : UITableViewController{
    IBOutlet UILabel *number;
    IBOutlet UILabel *title;
    __weak IBOutlet UIBarButtonItem *refresh;
    IBOutlet UILabel *author;
}

@property (nonatomic, weak) IBOutlet NSString *restaurantId;
- (IBAction)refresh:(id)sender;

@end
