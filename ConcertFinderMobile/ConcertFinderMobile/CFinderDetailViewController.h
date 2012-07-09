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

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *articleImageView;

@property (nonatomic, strong) UILabel* metaLabel;

@property (nonatomic, strong) UILabel* nameLabel;

@property (nonatomic, strong) UIWebView* articleWebView;

@property (nonatomic, strong) UIScrollView* scrollView;


@end
