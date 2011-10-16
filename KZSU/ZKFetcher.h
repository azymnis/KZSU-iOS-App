//
//  ZKFetcher.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZKFetcher : NSObject {
    
}

// Returns the current list of KZSU DJs
+(NSArray *)djs;

// Returns a list of the playlists for the dj with given id
+(NSArray *)playlistsForDj:(NSInteger)djId;

// Returns reviews for a given dj
+(NSArray *)reviewsForDj:(NSInteger)djId;

@end
