//
//  ProfileViewController.h
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController {
    IBOutlet UILabel *restaurantNameLabel;
}

@property (nonatomic, weak) IBOutlet NSString *restaurantId;
@property (nonatomic, weak) IBOutlet NSString *restaurantName;

@end
