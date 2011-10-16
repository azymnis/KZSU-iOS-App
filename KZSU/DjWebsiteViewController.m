//
//  DjWebsiteViewController.m
//  KZSU
//
//  Created by Argyris Zymnis on 5/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DjWebsiteViewController.h"


@implementation DjWebsiteViewController

@synthesize djUrl;

-(NSURLRequest *)urlRequest{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:self.djUrl]];
}

- (void)dealloc
{
    [webView release];
    [djUrl release];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)loadView
{
	webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	webView.scalesPageToFit = YES;
	self.view = webView;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[webView loadRequest:[self urlRequest]];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [webView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
