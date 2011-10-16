//
//  IndexedContainer.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IndexedContainer : NSObject {
    NSMutableArray *indices;
    NSArray *elements;
    NSMutableDictionary *indexedElements;
}

@property (readonly) NSMutableArray *indices;
@property (readonly) NSMutableDictionary *indexedElements;
@property (readonly) NSArray *elements;

-(NSArray *)elementsForSectionIndex:(NSInteger)index;
-(NSDictionary *)elementAtIndex:(NSIndexPath *)index;

@end
