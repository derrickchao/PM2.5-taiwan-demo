//
//  NavigationBar+customNav.m
//  PM2.5
//
//  Created by 趙子超 on 2016/1/5.
//  Copyright © 2016年 趙子超. All rights reserved.
//

#import "NavigationBar+customNav.h"

const CGFloat VFSNavigationBarHeightIncrease = 38.f;

@implementation NavigationBar_customNav

-(CGSize) sizeThatFits:(CGSize)size
{
    CGSize navigationBarSize = [super sizeThatFits: size];
    
    // Pad the base navigation bar height by the fitting height of our button.
    CGSize buttonSize = [self.customButton sizeThatFits:CGSizeMake(size.width, 0)];
    navigationBarSize.height += buttonSize.height;
    
    return navigationBarSize;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    CGSize buttonSize = [self.customButton sizeThatFits:CGSizeMake(self.bounds.size.width, 0)];
    self.customButton.frame = CGRectMake(0, 0, self.bounds.size.width, buttonSize.height);
}

- (void)setCustomButton:(UIButton *)customButton
{
    // Remove the previous button
    [_customButton removeFromSuperview];
    
    _customButton = customButton;
    
    [self addSubview:customButton];
    
    // Force our -sizeThatFits: method to be called again and flag the
    // navigation bar as needing layout.
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}

@end
