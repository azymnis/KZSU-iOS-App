//
//  DjTableViewController.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DjContainer.h"

@interface DjTableViewController : UITableViewController {
    DjContainer *djContainer;
}

@property (readonly) DjContainer *djContainer;

@end
