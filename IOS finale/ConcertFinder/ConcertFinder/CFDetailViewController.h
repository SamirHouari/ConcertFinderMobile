//
//  CFDetailViewController.h
//  ConcertFinder
//
//  Created by Samir Houari on 10/07/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
