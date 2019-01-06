//
//  JMSegmentedView.h
//  JMSegmentedView_Example
//
//  Created by Jim on 2019/1/6.
//  Copyright © 2019 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectItemBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface JMSegmentedView : UIView

@property (nonatomic , copy)selectItemBlock selectCallback;

- (instancetype)initWithFrame:(CGRect)frame WithItemTitles:(NSArray *)titles SelectCallBack:(selectItemBlock)selectBlock;

@end

NS_ASSUME_NONNULL_END
