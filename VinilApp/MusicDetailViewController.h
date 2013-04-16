//
//  MusicDetailViewController.h
//  VinilApp
//
//  Created by Abraao Barros Laceda on 16/04/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameMusic;
@property (nonatomic,retain)NSString *name_music;
@property (weak, nonatomic) IBOutlet UIButton *play;
@end
