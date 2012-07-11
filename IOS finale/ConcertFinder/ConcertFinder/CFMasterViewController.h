//
//  CFMasterViewController.h
//  ConcertFinder
//
//  Created by Samir Houari on 10/07/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface CFMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
