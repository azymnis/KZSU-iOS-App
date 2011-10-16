//
//  DjReviewsTableViewController.h
//  KZSU
//
//  Created by Argyris Zymnis on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DjReviewsContainer.h"

@interface DjReviewsTableViewController : UITableViewController {
    DjReviewsContainer *reviewContainer;
}

@property (readonly) DjReviewsContainer *container;

@end
