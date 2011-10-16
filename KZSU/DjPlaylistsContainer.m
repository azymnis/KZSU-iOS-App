//
//  DjPlaylistsContainer.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DjPlaylistsContainer.h"
#import "ZKFetcher.h"
@interface DjPlaylistsContainer()

@property (readonly) NSDateFormatter *pubDateFormatter;
@property (readonly) NSDateFormatter *prettyDateFormatter;
@property (readonly) NSDateFormatter *detailDateFormatter;

@end

@implementation DjPlaylistsContainer

@synthesize djId;

-(void)dealloc{
    [pubDateFormatter release];
    [prettyDateFormatter release];
    [detailDateFormatter release];
    [super dealloc];
}

-(NSDateFormatter *)pubDateFormatter{
    if(!pubDateFormatter){
        pubDateFormatter = [[NSDateFormatter alloc] init];
        [pubDateFormatter setDateFormat:@"yyyy-MM-dd"];
    }
    return pubDateFormatter;
}

-(NSDateFormatter *)prettyDateFormatter{
    if(!prettyDateFormatter){
        prettyDateFormatter = [[NSDateFormatter alloc] init];
        [prettyDateFormatter setDateFormat:@"EEEE MMM dd, yyyy, ha"];
    }
    return prettyDateFormatter;
}

-(NSDateFormatter *)detailDateFormatter{
    if(!detailDateFormatter){
        detailDateFormatter = [[NSDateFormatter alloc] init];
        [detailDateFormatter setDateFormat:@"yyyy-MM-ddHHmm"];
    }
    return detailDateFormatter;
}

-(NSString *)sectionTitleForElement:(NSDictionary *)element{
    NSString *pubDateString = [element objectForKey:@"showdate"];
    
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

-(NSArray *)elements{
    if(!elements) elements = [[ZKFetcher playlistsForDj:self.djId] retain];
    return elements;
}

-(NSString *)makePubDatePrettyForElement:(NSDictionary *)element{
    // Get date and time and combine them into one string
    NSString *pubDateString = [element objectForKey:@"showdate"];
    NSString *pubTimeString = [element objectForKey:@"showtime"];
    NSString *pubDateTime = [pubDateString stringByAppendingString:[pubTimeString substringToIndex:4]];
    
    // Convert pubDate to date object
    NSDate *pubDate = [self.detailDateFormatter dateFromString:pubDateTime];
    
    // Now convert date to pretty date
    return [self.prettyDateFormatter stringFromDate:pubDate];  
}

@end
