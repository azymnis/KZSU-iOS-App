//
//  DjDetailViewController.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DjDetailViewController : UITableViewController {
    NSDictionary *dj;
}

@property (retain) NSDictionary *dj;
@property (readonly) NSString *djUrl;
@property (readonly) NSString *djName;

@end
