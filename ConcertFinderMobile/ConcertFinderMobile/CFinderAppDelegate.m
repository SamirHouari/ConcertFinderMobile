//
//  CFinderAppDelegate.m
//  ConcertFinderMobile
//
//  Created by Samir Houari on 19/05/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import "CFinderAppDelegate.h"

#import "CFinderMasterViewController.h"
#import "Event.h"

@implementation CFinderAppDelegate

@synthesize window = _window;
@synthesize managedObjectContext = __managedObjectContext;
@synthesize managedObjectModel = __managedObjectModel;
@synthesize persistentStoreCoordinator = __persistentStoreCoordinator;


- (void)grabURLInBackground
{
    NSURL *url = [NSURL URLWithString:@"http://10.41.176.146:80/ConcertFinderMVC/ConcertFinderService.asmx/GetXEvents"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    [request setPostValue:@"2" forKey:@"nb_event"];
}

- (void)requestFinished:(ASIFormDataRequest *)request
{
    //NSString *responseString = [request responseString];
    NSData *responseData = [request responseData];
    NSString *error;
    NSPropertyListFormat format;
    NSDictionary* plist = [NSPropertyListSerialization propertyListFromData:responseData mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&error];
    NSLog(@"plist is %@", plist);
    if (!plist){
        NSLog(@"Error: %@", error);
        [error release];
    }
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithDictionary:plist];
    [self updatedb:plistDict];
}

- (void)requestFailed:(ASIFormDataRequest *)request
{
    //NSError *error = [request error];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    [self grabURLInBackground];

    //NSString *filePath = @"/Users/samirhouari/plist_example.plist";
    //NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    //[self updatedb:plistDict];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ConcertFinderMobile" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ConcertFinderMobile.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void )updatedb:(NSDictionary *) dict
{
    NSArray *content = [dict objectForKey:@"Datas"];
    // NSLog(@"\n\n\n Desc is: %@ \n\n\n\n\n",[content debugDescription]);
    int len = [content count];
    
        for (int i = 0; i < len; i++) 
        {
            NSMutableDictionary* itemdict = [[NSMutableDictionary alloc] initWithDictionary:[content objectAtIndex:i]];
             Event *e = (Event *)[NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:__managedObjectContext];
            e.ev_id = [itemdict objectForKey:@"Id"];
            e.date_begin = [itemdict objectForKey:@"DateDebut"];
            e.type = [itemdict objectForKey:@"Type"];
            e.img = [itemdict objectForKey:@"Image"];
            e.latitude = [itemdict objectForKey:@"Latitude"];
            e.longitude = [itemdict objectForKey:@"Longitude"];
            e.name = [itemdict objectForKey:@"Name"];
            e.rue = [itemdict objectForKey:@"Rue"];
            e.ville = [itemdict objectForKey:@"Ville"];
            e.cp = [itemdict objectForKey:@"CP"];
            e.pays = [itemdict objectForKey:@"Pays"];
            NSError *error = nil;
            if (![__managedObjectContext save:&error]) {
                // Handle the error.
                NSLog(@"Problem in adding an object CFFinderAppDelegate");
            }

        }
}

@end
