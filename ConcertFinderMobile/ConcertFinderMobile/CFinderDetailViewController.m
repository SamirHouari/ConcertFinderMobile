//
//  CFinderDetailViewController.m
//  ConcertFinderMobile
//
//  Created by Samir Houari on 19/05/12.
//  Copyright (c) 2012 Epita. All rights reserved.
//

#import "CFinderDetailViewController.h"
#import "Event.h"

@interface CFinderDetailViewController ()
- (void)configureView;
@end

@implementation CFinderDetailViewController

@synthesize titleLabel;
@synthesize dateLabel;
@synthesize locationLabel;
@synthesize eventImage;
@synthesize descLabel;
@synthesize detailItem;
@synthesize detailevent;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
        
        // Update the view.
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    Event *e =(Event *) detailItem;
    
    titleLabel.text = [e name];
    dateLabel.text = [NSString stringWithFormat:@"%@ : %@",
                      [e date_begin],
                      [e date_end]];
    locationLabel.text = [NSString stringWithFormat:@"%@ : %@ : %@",
                          [e rue],
                          [e ville],
                          [e pays]];
    descLabel.text = [e desc];
    
    
    //NSData *d = [[NSData alloc] i];
    //UIImage *img = [[UIImage alloc] initWithData:<#(NSData *)#>];
    //[[eventImage initWithImage:<#(UIImage *)#>]];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
  /*  self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [self.view addSubview:scrollView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 300, 61)];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [titleLabel setNumberOfLines:2];
    [scrollView addSubview:titleLabel];
    self.articleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 58, 320, 109)];
    [articleImageView setContentMode:UIViewContentModeScaleAspectFill];
    [articleImageView setClipsToBounds:YES];
    [scrollView addSubview:articleImageView];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 169, 170, 21)];
    [nameLabel setFont:[UIFont systemFontOfSize:13]];
    [nameLabel setText:@"By John Doe / Posted under: "];
    [scrollView addSubview:nameLabel];
    
    self.metaLabel = [[UILabel alloc] initWithFrame:CGRectMake(183, 169, 117, 21)];
    [metaLabel setFont:[UIFont systemFontOfSize:13]];
    [metaLabel setTextColor:[UIColor colorWithRed:30.0/255 green:144.0/255 blue:224.0/255 alpha:1.0]];
    [scrollView addSubview:metaLabel];
    
    self.articleWebView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 204, 300, 700)];
    [scrollView addSubview:articleWebView];
    
    UIView* dividerView = [[UIView alloc] initWithFrame:CGRectMake(10, 194, 300, 2)];
    [dividerView setBackgroundColor:[UIColor lightGrayColor]];
    [scrollView addSubview:dividerView];*/
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)setDetailevent:(Event *)newdetailevent 
{
    if (detailevent != newdetailevent) {
        detailevent = newdetailevent;
        // Update the view.
        [self configureView];
    }
}

@end
