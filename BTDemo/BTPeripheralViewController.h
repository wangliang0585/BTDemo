//
//  BTPeripheralViewController.h
//  BTDemo
//
//  Created by 王亮 on 13-8-23.
//  Copyright (c) 2013年 王亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTPeripheralViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *senderTextView;
@property (strong, nonatomic) IBOutlet UIButton *sendBtn;
- (IBAction)send:(id)sender;
@end
