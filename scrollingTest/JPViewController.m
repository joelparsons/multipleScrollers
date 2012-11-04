//
//  JPViewController.m
//  scrollingTest
//
//  Created by Joel Parsons on 04/11/2012.
//  Copyright (c) 2012 Joel Parsons. All rights reserved.
//

#import "JPViewController.h"

@interface JPViewController ()

@end

@implementation JPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addGestureRecognizer:self.scrollviewOnTop.panGestureRecognizer];
    
    [self.underScrollView removeGestureRecognizer:self.underScrollView.panGestureRecognizer];
    
    
    CGSize boundsSize = self.view.bounds.size;
    
    //hardcoated size of the image in this sample project.
    boundsSize.height = 480;
    self.underScrollView.contentSize = boundsSize;
    
    boundsSize.height *= 2.0f;
    self.scrollviewOnTop.contentSize = boundsSize;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //the scroll view underneath (in the container view) will have a max content offset equal to the content height
    //but minus the bounds height
    CGFloat maxYOffsetForUnderScrollView = self.underScrollView.contentSize.height - self.underScrollView.bounds.size.height;
    
    CGRect scrolledBoundsForContainerView = self.view.bounds;
    
    if (scrollView.contentOffset.y <= maxYOffsetForUnderScrollView) {
        //in this scenario we are still within the content for the contained scrollview
        //so we make sure the container view is scrolled to the top and set the offset for the contained scrollview
        self.containerView.bounds = scrolledBoundsForContainerView;
        self.underScrollView.contentOffset = scrollView.contentOffset;
        return;
    }
    
    //in this scenario we have scrolled throug the entirety of the contained scrollview
    //set its offset to the max and change the bounds of the container view to scroll everything else.
    self.underScrollView.contentOffset = CGPointMake(0, maxYOffsetForUnderScrollView);
    
    scrolledBoundsForContainerView.origin.y = scrollView.contentOffset.y - maxYOffsetForUnderScrollView;
    self.containerView.bounds = scrolledBoundsForContainerView;
}

@end
