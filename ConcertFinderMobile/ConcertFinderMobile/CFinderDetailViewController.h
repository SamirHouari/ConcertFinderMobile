//
//  CFinderDetailViewController.h
//  ConcertFinderMobile
//
//  Created by Samir Houari on 19/05/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface CFinderDetailViewController : UIViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *eventImage;

@property (nonatomic, strong) UILabel* descLabel;

@property (nonatomic, strong) UILabel* locationLabel;

@property (strong, nonatomic) Event *detailevent;

@property (nonatomic, strong) UILabel* dateLabel;

@end
