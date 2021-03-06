//
//  CFinderAppDelegate.h
//  ConcertFinderMobile
//
//  Created by Samir Houari on 19/05/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIFormDataRequest.h"

@interface CFinderAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void )updatedb:(NSDictionary *) dict;


- (void)grabURLInBackground;
- (void)requestFinished:(ASIFormDataRequest *)request;
- (void)requestFailed:(ASIFormDataRequest *)request;
- (int)getLastId;

@end
