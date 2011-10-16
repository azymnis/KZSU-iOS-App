//
//  DjWebsiteViewController.h
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DjWebsiteViewController : UIViewController {
    NSString *djUrl;
    UIWebView *webView;
}

@property (retain) NSString *djUrl;

@end
