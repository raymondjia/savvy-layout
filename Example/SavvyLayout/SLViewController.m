//
//  SLViewController.m
//  SavvyLayout
//
//  Created by Raymond Jia on 04/25/2015.
//  Copyright (c) 2014 Raymond Jia. All rights reserved.
//

#import "SavvyLayout.h"
#import "SLViewController.h"

@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self simplePositionAndSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - constructing UI in code

- (void) simplePositionAndSize {
    UIView *view1 = [self addSubViewWithColor:[UIColor redColor]];
    UIView *view2 = [self addSubViewWithColor:[UIColor greenColor]];
    UIView *view3 = [self addSubViewWithColor:[UIColor blueColor]];
    
    [[[[[SLConstraints for:view1] left:100] top:100] width:100] height:30];
    [[[[[SLConstraints for:view2] width:150] height:150] right:50] bottom:50];
    [[[[[SLConstraints for:view3] left:10] right:10] height:30] bottom:10];
    
}


- (UIView *) addSubViewWithColor:(UIColor *)bgColor {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = bgColor;
    [self.view addSubview:view];
    return view;
}

//    [[[SLConstraints for:@[ moneyImageView, moneyLabel ]] centerX] spaceY:5.f];
//    [[[[SLConstraints for:moneyImageView, moneyLabel, nil] centerX] spaceY:5.f] setName:@"image-label-v-spacing"];
//
//    [[SLConstraints named:@"image-label-v-spacing"] remove];
//    [[SLConstraints named:@"image-label-v-spacing"] setPriority:-100];
//    [[SLConstraints named:@"image-label-v-spacing"].enabled = NO;

@end
