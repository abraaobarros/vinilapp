//
//  PlacesTableViewController.m
//  VinilApp
//
//  Created by Igor R. Barroso on 13/05/13.
//  Copyright (c) 2013 Igor R. Barroso. All rights reserved.
//

#import "PlaceDetailViewController.h"
#import "PlacesTableViewController.h"
#import "ProfileViewController.h"

#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kjsonURL [NSURL URLWithString: @"http://dl.dropboxusercontent.com/u/28158427/vinilapp/locals.x"]

@interface PlacesTableViewController ()
@end

@implementation PlacesTableViewController {
    NSMutableArray *jsonResults;
}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // custom init
    }
    return self;
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
    
    jsonResults = [json objectForKey:@"locals"];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSDictionary *placesdict = [jsonResults objectAtIndex:indexPath.row];
    
    NSString *NameString = [placesdict objectForKey:@"name"];
    NSString *AddressString = [placesdict objectForKey:@"address"];
    
    cell.textLabel.text = NameString;
    cell.detailTextLabel.text = AddressString;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPlaceDetail"]) {
        ProfileViewController* vc = [[ProfileViewController alloc] init];
        UITabBarController* tbc = [segue destinationViewController];
        vc = (ProfileViewController *)[[tbc customizableViewControllers] objectAtIndex:0];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    //
    //     MusicTableViewController *detailViewController = [[MusicTableViewController alloc] init];
    //     // ...
    //     // Pass the selected object to the new view controller.
    //     [self.navigationController pushViewController:detailViewController animated:YES];
}


@end

