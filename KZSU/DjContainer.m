//
//  DjContainer.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DjContainer.h"
#import "ZKFetcher.h"

@implementation DjContainer

-(NSString *)sectionTitleForElement:(NSDictionary *)element{
    return [[[element objectForKey:@"airname"] substringToIndex:1] uppercaseString];
}

-(NSArray *)elements{
    if(!elements) elements = [[ZKFetcher djs] retain];
    return elements;
}

-(NSString *)titleAtIndex:(NSIndexPath *)index{
    NSDictionary *element = [self elementAtIndex:index];
    return [element objectForKey:@"airname"];
}

@end
