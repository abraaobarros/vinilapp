//
//  MusicTableCell.m
//  VinilApp
//
//  Created by Igor R. Barroso on 15/05/13.
//  Copyright (c) 2013 ITA Inc. All rights reserved.
//

#import "MusicTableCell.h"

@implementation MusicTableCell

@synthesize idLabel = _idLabel;
@synthesize numberLabel = _numberLabel;
@synthesize titleLabel = _titleLabel;
@synthesize authorLabel = _authorLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
