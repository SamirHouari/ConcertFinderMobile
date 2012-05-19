//
//  CFinderDetailViewController.h
//  ConcertFinderMobile
//
//  Created by Samir Houari on 19/05/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFinderDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
