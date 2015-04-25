//
//  FirstViewController.m
//  SavvyLayoutDemo
//
//  Created by Raymond Jia on 4/24/15.
//  Copyright (c) 2015 Cloud Communications LLC. All rights reserved.
//

#import "FirstViewController.h"
#import "SavvyLayout.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTopLeftCluster];
//    [self createTopRightCluster];
}



#pragma mark - UI initialization

- (void) createTopLeftCluster {
    UIImageView *moneyImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"money"]];
    UILabel *moneyLabel = [[UILabel alloc] init];
    moneyLabel.font = [UIFont systemFontOfSize:12.f];
    moneyLabel.textAlignment = NSTextAlignmentCenter;
    moneyLabel.textColor = [UIColor greenColor];
    moneyLabel.text = @"$1,000,000";
    
    [self.view addSubview:moneyImageView];
    [self.view addSubview:moneyLabel];
    
    [[[SLConstraints for:moneyImageView] setX:20.f] setY:20.f];
    
//    [[[SLConstraints for:@[ moneyImageView, moneyLabel ]] centerX] spaceY:5.f];
//    [[[[SLConstraints for:moneyImageView, moneyLabel, nil] centerX] spaceY:5.f] setName:@"image-label-v-spacing"];
//    
//    [[SLConstraints named:@"image-label-v-spacing"] remove];
//    [[SLConstraints named:@"image-label-v-spacing"] setPriority:-100];
//    [[SLConstraints named:@"image-label-v-spacing"].enabled = NO;

}

- (void) createTopRightCluster {
    
}

@end
