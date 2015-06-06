//
//  SavvyLayout.h
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


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


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


// initialization
+ (SLConstraints *) for:(UIView *)targetView;
+ (SLConstraints *) forViews:(NSArray *)views;

// position relative to superview
- (SLConstraints *) left:(CGFloat)value;
- (SLConstraints *) right:(CGFloat)value;
- (SLConstraints *) top:(CGFloat)value;
- (SLConstraints *) bottom:(CGFloat)value;

- (SLConstraints *) centerX;
- (SLConstraints *) centerY;

// position relative to another view
- (SLConstraints *) spaceX:(CGFloat)value fromView:(UIView *)otherView;
- (SLConstraints *) spaceY:(CGFloat)value fromView:(UIView *)otherView;
- (SLConstraints *) centerXWithView:(UIView *)otherView;
- (SLConstraints *) centerYWithView:(UIView *)otherView;

// size
- (SLConstraints *) width:(CGFloat)value;
- (SLConstraints *) height:(CGFloat)value;

// alignment

// distribution

// equal dimensions



@end
