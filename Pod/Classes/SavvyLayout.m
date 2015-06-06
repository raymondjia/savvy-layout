//
//  SavvyLayout.m
//  SavvyLayoutDemo
//
//  Created by Raymond Jia on 4/24/15.
//  Copyright (c) 2015 Raymond Jia <raymondjia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "SavvyLayout.h"

@interface SavvyLayoutManager : NSObject
@property (nonatomic, strong) NSMutableDictionary *namedConstrains;
+ (SavvyLayoutManager *) sharedManager;
@end

SavvyLayoutManager *_sharedManager;

@implementation SavvyLayoutManager
+ (SavvyLayoutManager *) sharedManager {
    // TODO: use GCD to ensure only one instance is ever created
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

#pragma mark - initialization

+ (SLConstraints *) for:(UIView *)targetView {
    SLConstraints *slc = [[SLConstraints alloc] initWithView:targetView];
    return slc;
}

#pragma mark - position relative to superview

- (SLConstraints *) left:(CGFloat)value {
    UIView *targetView = self.targetView;
    UIView *superView = targetView.superview;
    
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:targetView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superView
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.f
                                                           constant:value];
    [superView addConstraint:cx];
    return self;
}


- (SLConstraints *) top:(CGFloat)value {
    UIView *targetView = self.targetView;
    UIView *superView = targetView.superview;

    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:targetView
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.f
                                                                   constant:value];
    [superView addConstraint:constraint];
    return self;
}


- (SLConstraints *) right:(CGFloat)value {
    UIView *targetView = self.targetView;
    UIView *superView = targetView.superview;
    
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:targetView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superView
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.f
                                                           constant:-value];
    [superView addConstraint:cx];
    return self;
}


- (SLConstraints *) bottom:(CGFloat)value {
    UIView *targetView = self.targetView;
    UIView *superView = targetView.superview;
    
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:targetView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.f
                                                           constant:-value];
    [superView addConstraint:cx];
    return self;
}


#pragma mark - size
- (SLConstraints *) width:(CGFloat)value {
    UIView *targetView = self.targetView;
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:targetView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.f
                                                           constant:value];
    [targetView addConstraint:cx];
    return self;
}

- (SLConstraints *) height:(CGFloat)value {
    UIView *targetView = self.targetView;
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *cx = [NSLayoutConstraint constraintWithItem:targetView
                                                          attribute:NSLayoutAttributeHeight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:nil
                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                         multiplier:1.f
                                                           constant:value];
    [targetView addConstraint:cx];
    return self;
}


- (SLConstraints *) centerX {
    return [self centerXWithView:self.targetView.superview];
}

- (SLConstraints *) centerXWithView:(UIView *)otherView {
    UIView *targetView = self.targetView;
    UIView *superView = [self commonSuperviewWith:targetView and:otherView];
    
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:targetView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeCenterX
                                                                 multiplier:1.f
                                                                   constant:0.f];
    
    [superView addConstraint:constraint];
    return self;
}

- (SLConstraints *) centerY {
    return [self centerYWithView:self.targetView.superview];
}

- (SLConstraints *) centerYWithView:(UIView *)otherView {
    UIView *targetView = self.targetView;
    UIView *superView = [self commonSuperviewWith:targetView and:otherView];
    
    targetView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:targetView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeCenterY
                                                                 multiplier:1.f
                                                                   constant:0.f];
    
    [superView addConstraint:constraint];
    return self;
}


//
//- (UIView *)spaceY:(CGFloat)spc from:(UIView *)sibling {
//    
//    UIView *targetView = self.targetView;
//    UIView *superView = [self commonSuperviewWith:targetView and:referenceView];
//
//    targetView.translatesAutoresizingMaskIntoConstraints = NO;
//    sibling.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
//                                                          attribute:NSLayoutAttributeTop
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:sibling
//                                                          attribute:NSLayoutAttributeBottom
//                                                         multiplier:1.f
//                                                           constant:spc];
//    
//    [self.superview addConstraint:c1];
//    return self;
//}
//
//- (UIView *)spaceX:(CGFloat)spc from:(UIView *)sibling {
//    if ([MLManager isPad]) spc *= 2;
//    
//    self.translatesAutoresizingMaskIntoConstraints = NO;
//    sibling.translatesAutoresizingMaskIntoConstraints = NO;
//    NSLayoutConstraint *c1 = [NSLayoutConstraint constraintWithItem:self
//                                                          attribute:NSLayoutAttributeLeft
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:sibling
//                                                          attribute:NSLayoutAttributeRight
//                                                         multiplier:1.f
//                                                           constant:spc];
//    
//    [self.superview addConstraint:c1];
//    return self;
//}


//+ (SLConstraints *) for:(UIView *)targetView;
//+ (SLConstraints *) forViews:(NSArray *)views;
//
//// position relative to superview
//- (SLConstraints *) left:(CGFloat)value;
//- (SLConstraints *) right:(CGFloat)value;
//- (SLConstraints *) top:(CGFloat)value;
//- (SLConstraints *) bottom:(CGFloat)value;
//
//- (SLConstraints *) centerX;
//- (SLConstraints *) centerY;
//
//// position relative to another view
//- (SLConstraints *) spaceX:(CGFloat)value fromView:(UIView *)otherView;
//- (SLConstraints *) spaceY:(CGFloat)value fromView:(UIView *)otherView;
//- (SLConstraints *) centerXWithView:(UIView *)otherView;
//- (SLConstraints *) centerYWithView:(UIView *)otherView;
//
//// size
//- (SLConstraints *) width:(CGFloat)value;
//- (SLConstraints *) height:(CGFloat)value;


#pragma mark - private methods

- (instancetype) initWithView:(UIView *)view {
    self = [super init];
    self.targetView = view;
    self.superview = view.superview;
    return self;
}

// http://stackoverflow.com/questions/22666535/shared-ancestor-between-two-views
- (UIView *) commonSuperviewWith:(UIView *)thisView and:(UIView *)thatView {
    NSMutableSet *views = [NSMutableSet set];
    
    do {
        if (thisView != nil) {
            if ([views member:thisView])
                return thisView;
            [views addObject:thisView];
            thisView = thisView.superview;
        }
        
        if (thatView != nil) {
            if ([views member:thatView])
                return thatView;
            [views addObject:thatView];
            thatView = thatView.superview;
        }
    } while (thisView || thatView);
    
    return nil;
}

@end
