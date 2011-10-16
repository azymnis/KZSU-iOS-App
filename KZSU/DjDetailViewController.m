//
//  DjDetailViewController.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DjDetailViewController.h"
#import "DjWebsiteViewController.h"
#import "DjPlaylistsTableViewController.h"
#import "DjReviewsTableViewController.h"

@implementation DjDetailViewController

@synthesize dj;

+(BOOL) isValidUrl:(NSString *)url{
    return url && [url isKindOfClass:[NSString class]] && ![url isEqualToString:@""];
}

-(NSString *)djUrl{
    return self.dj ? [self.dj objectForKey:@"url"] : nil;
}

-(NSString *)djName{
    return self.dj ? [self.dj objectForKey:@"airname"]: nil;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [dj release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [DjDetailViewController isValidUrl:self.djUrl] ? 2 : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if([DjDetailViewController isValidUrl:self.djUrl]){
        return section == 0 ? 1 : 2;
    }else{
        return 2;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if([DjDetailViewController isValidUrl:self.djUrl]){
        return section == 0 ? @"Homepage" : @"DJ Info";
    }else{
        return @"DJ Info";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DJDetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    if ([DjDetailViewController isValidUrl:self.djUrl]) {
        if(indexPath.section == 0){
            cell.textLabel.text = @"Visit DJ Homepage";
        }else{
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Playlists";
            } else {
                cell.textLabel.text = @"Reviews";
            }
        }
    } else {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Playlists";
        } else {
            cell.textLabel.text = @"Reviews";
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    UIViewController *detailController;
    
    if ([DjDetailViewController isValidUrl:self.djUrl]) {
        if(indexPath.section == 0){
            DjWebsiteViewController *djwc = [[DjWebsiteViewController alloc] init];
            djwc.djUrl = self.djUrl;
            djwc.title = [NSString stringWithFormat:@"%@'s Website", self.djName];
            detailController = djwc;
        }else{
            if (indexPath.row == 0) {
                DjPlaylistsTableViewController *djptvc = [[DjPlaylistsTableViewController alloc] init];
                djptvc.djId = [[self.dj objectForKey:@"id"] intValue];
                djptvc.title = [NSString stringWithFormat:@"%@'s Playlists", self.djName];
                detailController = djptvc;
            } else {
                DjReviewsTableViewController *djrtvc = [[DjReviewsTableViewController alloc] init];
                djrtvc.container.djId = [[self.dj objectForKey:@"id"] intValue];
                detailController = djrtvc;
            }
        }
    } else {
        if (indexPath.row == 0) {
            DjPlaylistsTableViewController *djptvc = [[DjPlaylistsTableViewController alloc] init];
            djptvc.djId = [[self.dj objectForKey:@"id"] intValue];
            djptvc.title = [NSString stringWithFormat:@"%@'s Playlists", self.djName];
            detailController = djptvc;
        } else {
            DjReviewsTableViewController *djrtvc = [[DjReviewsTableViewController alloc] init];
            djrtvc.container.djId = [[self.dj objectForKey:@"id"] intValue];
            detailController = djrtvc;
        }
    }
    
    [self.navigationController pushViewController:detailController animated:NO];
    [detailController release];
}


@end
