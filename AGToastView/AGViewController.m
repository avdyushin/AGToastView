//
//  AGViewController.m
//  AGToastView
//
//  Created by Grigory Avdyushin on 4/1/13.
//  Copyright (c) 2013 Grigory Avdyushin. All rights reserved.
//

#import "AGViewController.h"
#import "AGToastView.h"

@interface AGViewController ()

@end

@implementation AGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"subtle_stripes"]];
    
    UIButton *toastButton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toastButton1.frame = CGRectMake(40, 80, 240, 44);
    toastButton1.tag = 1;
    
    [toastButton1 setTitle:@"Show Red Long Toast"
                 forState:UIControlStateNormal];
    
    [toastButton1 addTarget:self
                     action:@selector(showToast:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toastButton1];
    
    UIButton *toastButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toastButton2.frame = CGRectMake(40, 150, 240, 44);
    toastButton2.tag = 2;
    
    [toastButton2 setTitle:@"Show Black Short Toast"
                  forState:UIControlStateNormal];
    
    [toastButton2 addTarget:self
                     action:@selector(showToast:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toastButton2];

    UIButton *toastButton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    toastButton3.frame = CGRectMake(40, 220, 240, 44);
    toastButton3.tag = 3;
    
    [toastButton3 setTitle:@"Show Random Toast"
                 forState:UIControlStateNormal];
    
    [toastButton3 addTarget:self
                     action:@selector(showToast:)
           forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:toastButton3];

}

- (void)showToast:(UIButton *)button
{
    
    NSString *text;
    AGToastView *toast = [[AGToastView alloc] init];
    
    if (button.tag == 1) {
        
        text = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod"
                "tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,"
                "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
                "consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse"
                "cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non"
                "proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
        
        toast.backgroundView.backgroundColor = [UIColor redColor];
        
    } else if (button.tag == 2) {
        
        text = @"Short message here.";
        
    } else {
        
        toast.backgroundView.backgroundColor = [UIColor colorWithRed:(float)arc4random() / 0xFFFFFFFF
                                                               green:(float)arc4random() / 0xFFFFFFFF
                                                                blue:(float)arc4random() / 0xFFFFFFFF
                                                               alpha:1.0];
        
        NSArray *values = @[@"Apple", @"Orange", @"Pineapple", @"Dragon fruit", @"Coconut"];
        text = [NSString stringWithFormat:@"Random fruit is %@", values[arc4random()%values.count]];
        
    }
    

    toast.textLabel.text = text;
    [toast showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
