//
//  ZKFetcher.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ZKFetcher.h"
#import "JSON.h"

@implementation ZKFetcher

static NSString* server = @"http://www.zymnis.org/zk";

+(id)zkRequest:(NSString *)request{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", server, request];
	NSLog(@"Sent to ZK API: %@", urlString);
	return [[NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil] JSONValue];
}

+(NSArray *)djs{
    return [ZKFetcher zkRequest:@"djs"];
}

+(NSArray *)reviewsForDj:(NSInteger)djId{
    return [ZKFetcher zkRequest:[NSString stringWithFormat:@"djs/%d/reviews", djId]];
}

+(NSArray *)playlistsForDj:(NSInteger)djId{
    return [ZKFetcher zkRequest:[NSString stringWithFormat:@"djs/%d/playlists", djId]];
}

@end
