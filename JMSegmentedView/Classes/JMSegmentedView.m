//
//  JMSegmentedView.m
//  JMSegmentedView_Example
//
//  Created by Jim on 2019/1/6.
//  Copyright © 2019 Jim. All rights reserved.
//

#import "JMSegmentedView.h"
#import "UIView+JMViewTool.h"
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface JMSegmentedView ()

@property (nonatomic , strong)UIScrollView *scrollView;
@property (nonatomic , strong)UIView *indexView;
@property (nonatomic , strong)NSMutableArray *itemViews;
@property (nonatomic , strong)NSArray *itemTitles;
@property (nonatomic , assign)NSInteger index;

@end
@implementation JMSegmentedView

- (NSArray *)itemTitles
{
    if (!_itemTitles) {
        _itemTitles = [NSArray array];
    }
    return _itemTitles;
}

- (NSMutableArray *)itemViews
{
    if (!_itemViews) {
        _itemViews = [NSMutableArray array];
    }
    return _itemViews;
}

- (instancetype)initWithFrame:(CGRect)frame WithItemTitles:(NSArray *)titles SelectCallBack:(selectItemBlock )selectBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.index = 0;
        [self createSubViews:titles];
        self.itemTitles = titles;
        self.indexView.hidden = NO;

        self.selectCallback = selectBlock;
    }
    return self;
}



- (void)createSubViews:(NSArray *)titles
{
    if (self.itemViews.count >= titles.count) return;
    CGFloat itemW = titles.count > 4 ? SCREEN_WIDTH / 4 : SCREEN_WIDTH / titles.count;
    CGFloat itemH = self.frame.size.height;
    CGFloat itemY = 0;
    for (int i = 0; i < titles.count; i ++) {
        CGFloat itemX = itemW * i;
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.tag = i + 100;
        item.frame = CGRectMake(itemX, itemY, itemW, itemH);
        item.titleLabel.font = [UIFont systemFontOfSize:15];
        [item setTitle:titles[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [item addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) item.selected = YES;
        [self.scrollView addSubview:item];
        [self.itemViews addObject:item];
    }
}

- (void)selectItem:(UIButton *)sender
{
    UIButton *oldBtn = self.itemViews[self.index];
    if (sender == oldBtn) return;
    oldBtn.selected = NO;
    sender.selected = !oldBtn.selected;
    self.index = sender.tag - 100;
    if (self.selectCallback) {
        self.selectCallback(self.index);
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.indexView.centerX = sender.centerX;
    }];
    
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = self.bounds;
        _scrollView.scrollEnabled = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIView *)indexView
{
    if (!_indexView) {
        _indexView = [[UIView alloc]init];
        _indexView.frame = CGRectMake(0, self.frame.size.height - 2, self.itemTitles.count > 4 ? SCREEN_WIDTH / 4 : SCREEN_WIDTH / self.itemTitles.count, 2);
        _indexView.backgroundColor = [UIColor redColor];
        [self addSubview:_indexView];
    }
    return _indexView;
}

@end
