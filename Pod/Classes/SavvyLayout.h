//
//  SavvyLayout.h
//  SavvyLayoutDemo
//
//  Created by Raymond Jia on 4/24/15.
//  Copyright (c) 2015 Cloud Communications LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SavvyLayoutManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *namedConstrains;

+ (SavvyLayoutManager *) sharedManager;

@end


@interface SLConstraints : NSObject



//+ (SavvyLayout *) for:(UIView *)targetView;
//+ (SavvyLayout *) forViews:(UIView *)targetView, ...;
//
//- (SavvyLayout *)placedAtX:(CGFloat)x;
//- (SavvyLayout *)placedAtY:(CGFloat)y;
//- (SavvyLayout *)centerX;
//- (SavvyLayout *)centerX:(UIView *)sibling;
//- (SavvyLayout *)centerY;
//- (SavvyLayout *)centerY:(UIView *)sibling;
//- (SavvyLayout *)spaceX:(CGFloat)spc from:(UIView *)sibling;
//- (SavvyLayout *)spaceY:(CGFloat)spc from:(UIView *)sibling;
//- (SavvyLayout *)alignBaseline:(UIView *)sibling;
//- (SavvyLayout *)alignTop:(UIView *)sibling;
//- (SavvyLayout *)alignBottom:(UIView *)sibling;
//- (SavvyLayout *)alignLeft:(UIView *)sibling;
//- (SavvyLayout *)alignRight:(UIView *)sibling;
//- (SavvyLayout *)setWidth:(CGFloat)width;
//- (SavvyLayout *)setHeight:(CGFloat)height;
//- (SavvyLayout *)marginRight:(CGFloat)marginToSuperView;
//- (SavvyLayout *)marginBottom:(CGFloat)marginToSuperView;
//- (SavvyLayout *)yCenterBetween:(UIView *)topView and:(UIView *)bottomView;


+ (SLConstraints *) for:(UIView *)targetView;

- (SLConstraints *) setX:(CGFloat)x;
- (SLConstraints *) setY:(CGFloat)y;


@end
