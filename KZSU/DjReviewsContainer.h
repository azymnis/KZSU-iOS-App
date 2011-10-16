//
//  DjReviewsContainer.h
//  KZSU
//
//  Created by Argyris Zymnis on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IndexedContainer.h"


@interface DjReviewsContainer : IndexedContainer {
    int djId;
    NSDateFormatter *pubDateFormatter;
}

@property int djId;

@end
