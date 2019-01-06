//
//  UIView+JMViewTool.h
//  JMSegmentedView_Example
//
//  Created by Jim on 2019/1/6.
//  Copyright © 2019 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JMViewTool)

@property (nonatomic, assign) CGSize size;

@property (nonatomic,assign)  CGFloat x;

@property  (nonatomic,assign) CGFloat y;

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@end

NS_ASSUME_NONNULL_END
