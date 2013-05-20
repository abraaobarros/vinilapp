//
//  MusicTableCell.h
//  VinilApp
//
//  Created by Igor R. Barroso on 15/05/13.
//  Copyright (c) 2013 ITA Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicTableCell : UITableViewCell
    @property (nonatomic, weak) IBOutlet UILabel *idLabel;
    @property (nonatomic, weak) IBOutlet UILabel *numberLabel;
    @property (nonatomic, weak) IBOutlet UILabel *titleLabel;
    @property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@end
