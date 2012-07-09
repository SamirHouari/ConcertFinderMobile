//
//  SpectacleViewController.m
//  ConcertFinderMobile
//
//  Created by Samir Houari on 12/06/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import "SpectacleViewController.h"
#import "CFinderAppDelegate.h"
#import "Event.h"

@class Event;
@implementation SpectacleViewController

@synthesize managedObjectContext;
@synthesize eventsArray;
@synthesize fetchedResultsController = __fetchedResultsController;


- (void)viewDidLoad 
{ 
    [super viewDidLoad];
    /*NSString *str = @"08-10-1990";
     static NSDateFormatter *dateFormat = nil;
     if (dateFormat == nil) 
     {
     dateFormat = [[NSDateFormatter alloc] init];
     [dateFormat setTimeStyle:NSDateFormatterMediumStyle]; 
     [dateFormat setDateStyle:NSDateFormatterMediumStyle];
     [dateFormat setDateFormat:@"dd-MM-yyyy"];
     }*/
    
    
    //Get managed object Context;
    
    /*NSDate *date = [dateFormat dateFromString:str];
     UIBarButtonItem *addButton = [[UIBarButtonItem alloc] init];
     addButton.title = [dateFormat stringFromDate:date];
     self.navigationItem.leftBarButtonItem = addButton;
     */
    CFinderAppDelegate *delegate = (CFinderAppDelegate *) [[UIApplication sharedApplication] delegate];
    managedObjectContext = delegate.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"spectacle"];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:managedObjectContext];
    [request setEntity:entity];
    NSError *error = nil;
    NSMutableArray *mutableFetchResults = [[managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if (mutableFetchResults == nil) {
        // Handle the error.
    }
    
    [self setEventsArray:mutableFetchResults];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [eventsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath 
{
    static NSDateFormatter *dateFormatter = nil;
    if (dateFormatter == nil) 
    {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle]; 
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    }
    static NSString *CellIdentifier = @"CCell";
    // Dequeue or create a new cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) { 
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    } 
    Event *event = (Event *)[eventsArray objectAtIndex:indexPath.row]; 
    cell.textLabel.text = event.titre;
    NSString *string = [NSString stringWithFormat:@"%@ : %@",
                        [dateFormatter stringFromDate:[event date_begin]],
                        [event ville]]; 
    cell.detailTextLabel.text = string;
    return cell;
}
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
