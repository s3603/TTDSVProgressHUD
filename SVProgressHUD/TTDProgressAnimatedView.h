//
//  TTDProgressAnimatedView.h
//  TTDProgressHUD, https://github.com/TTDProgressHUD/TTDProgressHUD
//
//  Copyright (c) 2017-2023 Tobias Totzek and contributors. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTDProgressAnimatedView : UIView

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) CGFloat strokeThickness;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeEnd;

@end
