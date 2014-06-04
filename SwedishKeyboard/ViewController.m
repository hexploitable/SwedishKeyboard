//
//  ViewController.m
//  SwedishKeyboard
//
//  Created by Stephen Darlington on 04/06/2014.
//  Copyright (c) 2014 Wandle Software Limited. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.sampleTextField becomeFirstResponder];
}

- (IBAction)tapWTF:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ysrnry.co.uk/hurdieho.htm"]];
}
@end
