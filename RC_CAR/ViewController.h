//
//  ViewController.h
//  RC_CAR
//
//  Created by Liming on 2013/12/22.
//  Copyright (c) 2013年 Liming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *forward;
- (IBAction)forward_press:(id)sender;
- (IBAction)forward_touch_down:(id)sender;


- (IBAction)BACK_touch:(id)sender;
- (IBAction)RIGHT_touch:(id)sender;

- (IBAction)LEFT_touch:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *kxview;
@property (weak, nonatomic) IBOutlet UIButton *start_live;
- (IBAction)click_live:(id)sender;

@end
