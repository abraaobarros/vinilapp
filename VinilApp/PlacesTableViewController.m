//
//  PlacesTableViewController.m
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "ProfileViewController.h"
#import "PlacesTableCell.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kjsonURL [NSURL URLWithString: @"http://vinilapp.herokuapp.com/api/bars.json"]

@interface PlacesTableViewController ()

@end

@implementation PlacesTableViewController {
    NSMutableArray *jsonResults;
    NSString *selectedId;
    NSString *selectedName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(kBgQueue, ^{
        NSData* data = [NSData dataWithContentsOfURL:kjsonURL];
        [self performSelectorOnMainThread:@selector(fetchedData:) withObject:data waitUntilDone:YES];
    });
}

- (void)fetchedData:(NSData *)responseData {
    NSError* error;
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    
    jsonResults = [json objectForKey:@"bars"];
    
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
    
    PlacesTableCell *cell = (PlacesTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PlacesTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSDictionary *placesdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSString *IdString = [NSString stringWithFormat:@"%@", [placesdict objectForKey:@"id"]];
    NSString *NameString = [placesdict objectForKey:@"name"];
    
    cell.idLabel.text = IdString;
    cell.nameLabel.text = NameString;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlacesTableCell *cell = (PlacesTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"RestaurantSelected" sender:cell];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"RestaurantSelected"]) {
        PlacesTableCell *cell = (PlacesTableCell *)sender;
        
        ProfileViewController *profile = [segue destinationViewController];
        profile.restaurantId = cell.idLabel.text;
        profile.restaurantName = cell.nameLabel.text;
    }
}


@end

