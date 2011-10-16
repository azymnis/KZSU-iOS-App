//
//  IndexedContainer.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IndexedContainer.h"


@implementation IndexedContainer

-(NSString *)sectionTitleForElement:(NSDictionary *)element{
    return @"";
}

-(NSArray *)elements{
    if(!elements) elements = [[NSArray alloc] init];
    return elements;
}

-(NSMutableDictionary *)indexedElements{
    if(!indexedElements){
        indexedElements = [[NSMutableDictionary alloc] init];
        for (NSDictionary *element in self.elements) {
            NSString *secTitle = [self sectionTitleForElement:element];
            if (![indexedElements objectForKey:secTitle]){
                [indexedElements setObject:[NSMutableArray array]  forKey:secTitle];
                [indices addObject:secTitle];
            }
            
            NSMutableArray *curlist = [indexedElements objectForKey:secTitle];
            [curlist addObject:element];
        }
    }
    return indexedElements;
}

-(NSMutableArray *)indices{
    if(!indices){
        indices = [[NSMutableArray alloc] init];
        int indCount = self.indexedElements.count;
        NSLog(@"initialized container with %d indices", indCount);
    }
    return indices;
}

-(NSArray *)elementsForSectionIndex:(NSInteger)index{
    NSString *secTitle = [self.indices objectAtIndex:index];
    return [self.indexedElements objectForKey:secTitle];
}

-(NSDictionary *)elementAtIndex:(NSIndexPath *)index{
    NSArray *curplaces = [self elementsForSectionIndex:index.section];
    return [curplaces objectAtIndex:index.row];
}

-(void)dealloc{
    [elements release];
    [indices release];
    [indexedElements release];
    [super dealloc];
}

@end
