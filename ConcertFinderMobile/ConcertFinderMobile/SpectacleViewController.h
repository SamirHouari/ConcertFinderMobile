//
//  SpectacleViewController.h
//  ConcertFinderMobile
//
//  Created by Samir Houari on 12/06/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpectacleViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *eventsArray;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
