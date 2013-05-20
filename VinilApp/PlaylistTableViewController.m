//
//  PlaylistTableViewController.m
//  VinilApp
//
//  Created by Abraao Barros Laceda on 16/04/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import "PlaylistTableViewController.h"
#import "MusicTableCell.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//#define kjsonURL [NSURL URLWithString: @"http://dl.dropboxusercontent.com/u/28158427/vinilapp/playlist.x"]
#define urlPrefix @"http://localhost/~IgorBarroso/vinilapp/playlist.php?id="

@interface PlaylistTableViewController ()

@end

@implementation PlaylistTableViewController {
    NSMutableArray *jsonResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *URL = [NSString stringWithFormat:@"%@%@", urlPrefix, _restaurantId];
    NSURL *kjsonURL = [NSURL URLWithString:URL];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:kjsonURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    jsonResults = [json objectForKey:@"playlist"];
    
    [self.tableView reloadData];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [jsonResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    MusicTableCell *cell = (MusicTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MusicTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *placesdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSString *TitleString = [placesdict objectForKey:@"title"];
    NSString *AuthorString = [placesdict objectForKey:@"author"];
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    cell.titleLabel.text = TitleString;
    cell.authorLabel.text = AuthorString;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];  
}

@end