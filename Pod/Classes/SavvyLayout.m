//
//  SavvyLayout.m
//  SavvyLayoutDemo
//
//  Created by Raymond Jia on 4/24/15.
//  Copyright (c) 2015 Cloud Communications LLC. All rights reserved.
//

#import "SavvyLayout.h"

SavvyLayoutManager *_sharedManager;

@implementation SavvyLayoutManager

+ (SavvyLayoutManager *) sharedManager {
    if (_sharedManager == nil)
        _sharedManager = [[SavvyLayoutManager alloc] init];
    return _sharedManager;
}

@end

@interface SLConstraints ()

@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, strong) NSMutableArray *targetViews;
@property (nonatomic, strong) UIView *superview;

@property (nonatomic, strong) NSLayoutConstraint *lastConstraint;
@property (nonatomic, strong) NSMutableArray *lastConstraints;

@end

@implementation SLConstraints


+ (SLConstraints *) for:(UIView *)targetView {
    SLConstraints *slc = [[SLConstraints alloc] initWithView:targetView];
    return slc;
}


- (SLConstraints *) setX:(CGFloat)x {
    self.targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:self.targetView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.superview
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:x];
    [self.superview addConstraint:cx];
    return self;
}

- (SLConstraints *) setY:(CGFloat)y {
    self.targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:self.targetView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:self.superview
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.f
                                                                   constant:y];
    [self.superview addConstraint:cx];
    return self;
}

#pragma mark - private methods

- (instancetype) initWithView:(UIView *)view {
    self = [super init];
    self.targetView = view;
    self.superview = view.superview;
    return self;
}


@end
