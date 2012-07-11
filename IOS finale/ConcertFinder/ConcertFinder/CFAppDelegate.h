//
//  CFAppDelegate.h
//  ConcertFinder
//
//  Created by Samir Houari on 10/07/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
