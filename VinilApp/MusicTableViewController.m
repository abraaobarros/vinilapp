//
//  MusicTableViewController.m
//  VinilApp
//
//  Created by Abraao Barros Laceda on 16/04/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import "MusicTableViewController.h"
#import "MusicTableCell.h"
#import <objc/runtime.h>

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define urlPrefix @"http://vinilapp.herokuapp.com/api/musics/"

@interface MusicTableViewController ()

@end

const char musicId;

@implementation MusicTableViewController {
    NSMutableArray *jsonResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *URL = [NSString stringWithFormat:@"%@%@%@", urlPrefix, _restaurantId, @".json"];
    NSURL *kjsonURL = [NSURL URLWithString:URL];

    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:kjsonURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    jsonResults = [json objectForKey:@"musics"];
    
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
    NSString *AuthorString = [placesdict objectForKey:@"artist"];
    NSNumber *Hash = (NSNumber *)[placesdict objectForKey:@"hash"];
    
    cell.numberLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    cell.titleLabel.text = TitleString;
    cell.authorLabel.text = AuthorString;
    cell.idLabel.text = [Hash stringValue];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSDictionary *placesdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSString *TitleString = [placesdict objectForKey:@"title"];
    NSString *AuthorString = [placesdict objectForKey:@"artist"];
    NSNumber *Hash = (NSNumber *)[placesdict objectForKey:@"hash"];
    
    UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:TitleString];
	[alert setMessage:AuthorString];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"Toca aí!"];
	[alert addButtonWithTitle:@"Não"];
	[alert show];
    
    objc_setAssociatedObject(alert, &musicId, [Hash stringValue], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (buttonIndex == 0) {

        
        UIAlertView *alert = [[UIAlertView alloc] init];
        [alert setMessage:@"Sua música foi adicionada à playlist"];
        [alert addButtonWithTitle:objc_getAssociatedObject(alertView, &musicId)];
        [alert show];
	} else if (buttonIndex == 1) {
		// No
	}
}

@end

