//
//  DjPlaylistsTableViewController.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DjPlaylistsContainer.h"

@interface DjPlaylistsTableViewController : UITableViewController {
    DjPlaylistsContainer *playlistsContainer;
    int djId;
}

@property (readonly) DjPlaylistsContainer *container;
@property int djId;

@end
