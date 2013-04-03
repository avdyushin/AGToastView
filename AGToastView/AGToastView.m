//
//  AGToastView.m
//  AGToastView
//
//  Created by Grigory Avdyushin on 4/1/13.
//  Copyright (c) 2013 Grigory Avdyushin. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "AGToastView.h"

@implementation AGToastView

@synthesize backgroundView, textLabel;
@synthesize backgroundAlpha, duration, delay;
@synthesize textPadding, marginBottom, cornerRadius;
@synthesize maxWidth, maxHeight;

- (id)init
{
    self = [super init];
    if (self) {
        
        // Hidden
        self.alpha      = 0;
        
        // Use build-in view
        useCustomView   = NO;
        
        // Setup defaults        
        backgroundAlpha = DEFAULT_ALPHA;
        duration        = DEFAULT_DURATION;
        delay           = DEFAULT_DALAY;
        textPadding     = DEFAULT_PADDING;
        cornerRadius    = DEFAULT_RADIUS;
        marginBottom    = DEFAULT_MARGIN;
        maxWidth        = MAX_WIDTH;
        maxHeight       = MAX_HEIGHT;
        
        //
        backgroundView = [[UIView alloc] init];
        backgroundView.backgroundColor     = [UIColor blackColor];
        backgroundView.layer.cornerRadius  = cornerRadius;
        backgroundView.layer.shadowColor   = [UIColor blackColor].CGColor;
        backgroundView.layer.shadowOpacity = 0.5;
        backgroundView.layer.shadowOffset  = CGSizeMake(0, 1);
        backgroundView.layer.shadowRadius  = 5;
        
        //
        textLabel = [[UILabel alloc] init];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor       = [UIColor whiteColor];
        textLabel.numberOfLines   = 0;
        textLabel.textAlignment   = NSTextAlignmentCenter;
        textLabel.shadowOffset    = CGSizeMake(0, -1);
        textLabel.shadowColor     = [UIColor colorWithWhite:0 alpha:0.5];
        textLabel.font            = [UIFont systemFontOfSize:14];
        
        [self addSubview:backgroundView];
        [self addSubview:textLabel];
        
    }
    return self;
}

- (id)initWithCustomView:(UIView *)view
{
    self = [self init];
    if (self) {
        
        // Initialization code
        if (view) {
            
            // Use custom view
            useCustomView  = YES;
            [self addSubview:view];
            
            // Our view is hidden
            backgroundView.alpha = 0;
            textLabel.alpha      = 0;
            
        }

        
    }
    return self;
}


- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    if (useCustomView)   return;
    if (!textLabel.text) return;

    CGSize size = [textLabel.text sizeWithFont:textLabel.font
                             constrainedToSize:CGSizeMake(maxWidth - textPadding * 2, MAXFLOAT)];
    
    CGRect frame = CGRectMake(0, 0,
                              maxWidth  - textPadding * 2,
                              maxHeight - textPadding * 2);
    
    frame.size.height = size.height > maxHeight - textPadding * 2 ? maxHeight - textPadding * 2 : size.height;
    frame.size.width  = size.width  > maxWidth  - textPadding * 2 ? maxWidth  - textPadding * 2 : size.width;
    
    textLabel.frame = frame;
    backgroundView.frame = CGRectInset(frame, -textPadding, -textPadding);
    
    CGRect shadowRect = CGRectMake(0, 0,
                                   CGRectGetWidth(backgroundView.frame),
                                   CGRectGetHeight(backgroundView.frame));
    
    backgroundView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:shadowRect
                                                                 cornerRadius:cornerRadius].CGPath;
    
    backgroundView.alpha = backgroundAlpha;
    
    CGPoint center = CGPointMake( SCREEN_W / 2, SCREEN_H - CGRectGetHeight(backgroundView.frame)/2 - 20 /* status bar */ - marginBottom);
    textLabel.center = center;
    backgroundView.center = center;
    
}

- (void)showInView:(UIView *)view withDelay:(NSTimeInterval)newDelay
{
    //
    if (newDelay < 0) newDelay = delay;
    
    // Добавляем на экран
    [view addSubview:self];
    // Уменьшаяем прозрачность, показываем наше представление
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^() { self.alpha = 1.0f; }
                     completion:^(BOOL finished) {
                         
         if (finished) {
             // Увеличиваем прозрачность, прячем представление
             [UIView animateWithDuration:duration
                                   delay:newDelay
                                 options:UIViewAnimationOptionCurveEaseOut
                              animations:^() { self.alpha = 0; }
                              completion:^(BOOL finished) { [self removeFromSuperview]; }];
         }
                         
     }];
    
}

- (void)showInView:(UIView *)view
{
    [self showInView:view withDelay:delay];
}


@end
