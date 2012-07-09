//
//  FavConcertViewController.m
//  ConcertFinderMobile
//
//  Created by Samir Houari on 12/06/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import "FavConcertViewController.h"
#import "Event.h"
#import "CFinderAppDelegate.h"

@class Event;
@implementation FavConcertViewController

@synthesize managedObjectContext;
@synthesize eventsArray;
@synthesize fetchedResultsController = __fetchedResultsController;

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
@end
