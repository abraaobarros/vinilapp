//
//  PlacesTableCell.h
//  VinilApp
//
//  Created by Igor R. Barroso on 15/05/13.
//  Copyright (c) 2013 ITA Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesTableCell : UITableViewCell
    @property (nonatomic, weak) IBOutlet UILabel *idLabel;
    @property (nonatomic, weak) IBOutlet UILabel *nameLabel;
    @property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@end
