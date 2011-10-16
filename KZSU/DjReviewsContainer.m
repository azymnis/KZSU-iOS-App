//
//  DjReviewsContainer.m
//  KZSU
//
//  Created by Argyris Zymnis on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DjReviewsContainer.h"
#import "ZKFetcher.h"

@interface DjReviewsContainer() 

@property (readonly) NSDateFormatter *pubDateFormatter;

@end

@implementation DjReviewsContainer

@synthesize djId;

-(void) dealloc{
    [pubDateFormatter release];
    [super dealloc];
}

-(NSDateFormatter *)pubDateFormatter{
    if(!pubDateFormatter){
        pubDateFormatter = [[NSDateFormatter alloc] init];
        [pubDateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    return pubDateFormatter;
}

-(NSArray *)elements{
    if(!elements) elements = [[ZKFetcher reviewsForDj:self.djId] retain];
    return elements;
}

-(NSString *)sectionTitleForElement:(NSDictionary *)element{
    NSString *pubDateString = [element objectForKey:@"created"];
    
    // Convert pubDate to date object
    NSDate *pubDate = [self.pubDateFormatter dateFromString:pubDateString];
    
    // Find the time delta from today
    NSInteger delta = -1*[pubDate timeIntervalSinceNow];
    
    if (delta < 3600*24*7) {
        // Less than a week
        return @"Past 7 days";
    }else if(delta < 3600*24*30){
        // Less than a month ago
        return @"Past 30 days";
    }else if(delta < 6*3600*24*30){
        return @"Past six months";
    }else if(delta < 3600*24*365){
        return @"Past year";
    }else if(delta < 3*3600*24*365){
        return @"Past 3 years";
    }else{
        return @"More than 3 years ago";        
    }
}

@end
