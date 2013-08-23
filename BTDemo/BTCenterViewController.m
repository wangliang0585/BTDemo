//
//  BTCenterViewController.m
//  BTDemo
//
//  Created by 王亮 on 13-8-23.
//  Copyright (c) 2013年 王亮. All rights reserved.
//

#import "BTCenterViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "BTUDID.h"

@interface BTCenterViewController ()<CBCentralManagerDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) CBCentralManager      *centralManager;
@property (strong, nonatomic) CBPeripheral          *discoveredPeripheral;
@property (strong, nonatomic) NSMutableData         *receiveData;
@end

@implementation BTCenterViewController

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
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    self.receiveData = [NSMutableData data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setReceiveTextView:nil];
    [super viewDidUnload];
}

- (void)scan
{
    [self.centralManager scanForPeripheralsWithServices:@[[CBUUID UUIDWithString:BT_Center_UUID]]
                                                options:@{ CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
    
    NSLog(@"Scanning started");
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    CBCentralManagerState state = central.state;
    NSString *stateString;
    
    switch (state) {
        case CBCentralManagerStateUnknown:
            stateString = @"State unknown, update imminent.";
            break;
        case CBCentralManagerStateResetting:
            stateString = @"The connection with the system service was momentarily lost, update imminent.";
            break;
        case CBCentralManagerStateUnsupported:
            stateString = @"The platform doesn't support the Bluetooth Low Energy Central/Client role.";
            break;
        case CBCentralManagerStateUnauthorized:
            stateString = @"The application is not authorized to use the Bluetooth Low Energy Central/Client role.";
            break;
        case CBCentralManagerStatePoweredOff:
            stateString = @"Bluetooth is currently powered off.";
            break;
            
        default:
            NSLog(@"Bluetooth is currently powered on and available to use.");
            break;
    }
    
    if (!stateString) {
        [self scan];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!!!" message:stateString delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
