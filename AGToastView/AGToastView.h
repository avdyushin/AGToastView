//
//  AGToastView.h
//  AGToastView
//
//  Created by Grigory Avdyushin on 4/1/13.
//  Copyright (c) 2013 Grigory Avdyushin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEFAULT_ALPHA     0.75f
#define DEFAULT_DURATION  0.5f
#define DEFAULT_DALAY     1.0f
#define DEFAULT_PADDING  15.0f
#define DEFAULT_MARGIN   22.0f
#define DEFAULT_RADIUS    5.0f

#define SCREEN_W ( CGRectGetWidth ([[UIScreen mainScreen] bounds]) )
#define SCREEN_H ( CGRectGetHeight([[UIScreen mainScreen] bounds]) )

#define MAX_WIDTH   ( SCREEN_W - 20 )
#define MAX_HEIGHT  ( SCREEN_H / 4  )

@interface AGToastView : UIView {
    BOOL useCustomView;
}

- (id)initWithCustomView:(UIView *)view;
- (void)showInView:(UIView *)view;
- (void)showInView:(UIView *)view withDelay:(NSTimeInterval)delay;

@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UILabel *textLabel;

@property (assign, nonatomic) NSTimeInterval duration;
@property (assign, nonatomic) NSTimeInterval delay;

@property (assign, nonatomic) CGFloat textPadding;
@property (assign, nonatomic) CGFloat marginBottom;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) CGFloat backgroundAlpha;
@property (assign, nonatomic) CGFloat maxWidth;
@property (assign, nonatomic) CGFloat maxHeight;

@end
