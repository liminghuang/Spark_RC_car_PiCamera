//
//  ViewController.m
//  RC_CAR
//
//  Created by Liming on 2013/12/22.
//  Copyright (c) 2013年 Liming. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "KxMovieViewController.h"

#define ACCESS_TOKEN @"YOUR TOKEN"
#define DEVICE_ID @"YOUR ID"
#define PI_CAMERA_HOST @"http://192.168.2.131:8554/"

@interface ViewController ()

@end

@implementation ViewController
@synthesize kxview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forward_press:(id)sender {
    NSLog(@"release...");
    NSString *check_url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/rccar", DEVICE_ID];
    NSDictionary *parameters = @{@"access_token": ACCESS_TOKEN, @"params": @"rc,STOP"};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:check_url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self methodUsingJsonFromSuccessBlock:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self methodUsingJsonFromFaildBlock];
        NSLog(@"Error: %@", [error debugDescription]);
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}


- (IBAction)forward_touch_down:(id)sender {
    NSLog(@"touch...");
    NSString *check_url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/rccar", DEVICE_ID];
    NSDictionary *parameters = @{@"access_token": ACCESS_TOKEN, @"params": @"rc,FORWARD"};

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:check_url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self methodUsingJsonFromSuccessBlock:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self methodUsingJsonFromFaildBlock];
        NSLog(@"Error: %@", [error debugDescription]);
        NSLog(@"Error: %@", [error localizedDescription]);
    }];

}

- (IBAction)BACK_touch:(id)sender {
    NSLog(@"BACK touch...");
    NSString *check_url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/rccar", DEVICE_ID];
    NSDictionary *parameters = @{@"access_token": ACCESS_TOKEN, @"params": @"rc,BACK"};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:check_url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self methodUsingJsonFromSuccessBlock:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self methodUsingJsonFromFaildBlock];
        NSLog(@"Error: %@", [error debugDescription]);
        NSLog(@"Error: %@", [error localizedDescription]);
    }];

}

- (IBAction)RIGHT_touch:(id)sender {
    NSLog(@"RIGHT touch...");
    NSString *check_url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/rccar", DEVICE_ID];
    NSDictionary *parameters = @{@"access_token": ACCESS_TOKEN, @"params": @"rc,RIGHT"};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:check_url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self methodUsingJsonFromSuccessBlock:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self methodUsingJsonFromFaildBlock];
        NSLog(@"Error: %@", [error debugDescription]);
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}

- (IBAction)LEFT_touch:(id)sender {
    NSLog(@"LEFT touch...");
    NSString *check_url = [NSString stringWithFormat:@"https://api.spark.io/v1/devices/%@/rccar", DEVICE_ID];
    NSDictionary *parameters = @{@"access_token": ACCESS_TOKEN, @"params": @"rc,LEFT"};
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager POST:check_url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self methodUsingJsonFromSuccessBlock:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self methodUsingJsonFromFaildBlock];
        NSLog(@"Error: %@", [error debugDescription]);
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}


- (void)methodUsingJsonFromSuccessBlock:(id)json {
    //NSString *JS_value = [[NSString alloc] initWithFormat:@"%@",[json valueForKeyPath:@"return_value"]];
    NSLog(@"json from the block : %@", [json valueForKeyPath:@"return_value"]);
}

- (void)methodUsingJsonFromFaildBlock {
}

- (IBAction)click_live:(id)sender {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        parameters[KxMovieParameterDisableDeinterlacing] = @(YES);
    
    KxMovieViewController *vc;
    
    NSString *pi_camera_URL = [[NSString alloc] initWithFormat:@"%@", PI_CAMERA_HOST];
    vc = [KxMovieViewController movieViewControllerWithContentPath:pi_camera_URL parameters:parameters];
    
    //[self presentViewController:vc animated:YES completion:nil];
    vc.view.frame = self.kxview.bounds;
    [self.kxview addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    [self addChildViewController:vc];

}
@end
