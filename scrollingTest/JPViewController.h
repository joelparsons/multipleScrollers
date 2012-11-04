//
//  JPViewController.h
//  scrollingTest
//
//  Created by Joel Parsons on 04/11/2012.
//  Copyright (c) 2012 Joel Parsons. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPViewController : UIViewController
<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewOnTop;
@property (weak, nonatomic) IBOutlet UIScrollView *underScrollView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@end
