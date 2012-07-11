//
//  Event.h
//  ConcertFinder
//
//  Created by Samir Houari on 10/07/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Event : NSManagedObject

@property (nonatomic, retain) NSString * cp;
@property (nonatomic, retain) NSDate * date_begin;
@property (nonatomic, retain) NSDate * date_end;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * ev_id;
@property (nonatomic, retain) NSNumber * fav;
@property (nonatomic, retain) NSString * img;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * pays;
@property (nonatomic, retain) NSString * rue;
@property (nonatomic, retain) NSString * titre;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * ville;

@end
