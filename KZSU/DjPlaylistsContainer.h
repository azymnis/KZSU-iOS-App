//
//  DjPlaylistsContainer.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexedContainer.h"

@interface DjPlaylistsContainer : IndexedContainer {
    int djId;
    NSDateFormatter *pubDateFormatter;
    NSDateFormatter *detailDateFormatter;    
    NSDateFormatter *prettyDateFormatter;    
}

@property int djId;

// Converts something like '2011-05-25' to 'Wednesday, May 25, 2011'
-(NSString *)makePubDatePrettyForElement:(NSDictionary *)element;

@end
