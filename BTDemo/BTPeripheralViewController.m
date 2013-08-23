//
//  BTPeripheralViewController.m
//  BTDemo
//
//  Created by 王亮 on 13-8-23.
//  Copyright (c) 2013年 王亮. All rights reserved.
//

#import "BTPeripheralViewController.h"

@interface BTPeripheralViewController ()

@end

@implementation BTPeripheralViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSenderTextView:nil];
    [self setSendBtn:nil];
    [super viewDidUnload];
}
- (IBAction)send:(id)sender {
}
@end
