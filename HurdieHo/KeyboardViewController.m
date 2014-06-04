//
//  KeyboardViewController.m
//  HurdieHo
//
//  Created by Stephen Darlington on 04/06/2014.
//  Copyright (c) 2014 Wandle Software Limited. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@property (nonatomic, strong) UIButton *hurdieKeyboardButton;
@property (nonatomic, strong) UIButton *hoKeyboardButton;

@end

@implementation KeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hurdieKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.hurdieKeyboardButton setTitle:NSLocalizedString(@"Hurdie", nil) forState:UIControlStateNormal];
    [self.hurdieKeyboardButton sizeToFit];
    self.hurdieKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.hurdieKeyboardButton.backgroundColor = [UIColor darkGrayColor];
    [self.hurdieKeyboardButton addTarget:self action:@selector(tapHurdie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hurdieKeyboardButton];
    
    self.hoKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.hoKeyboardButton setTitle:NSLocalizedString(@"Ho", nil) forState:UIControlStateNormal];
    [self.hoKeyboardButton sizeToFit];
    self.hoKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.hoKeyboardButton.backgroundColor = [UIColor darkGrayColor];
    [self.hoKeyboardButton addTarget:self action:@selector(tapHo:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hoKeyboardButton];
    
    NSArray* buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-Edge-[Hurdie]-Gap-[Ho]-Edge-|"
                                                                         options:NSLayoutFormatAlignAllTop
                                                                         metrics:@{ @"Edge" : @10, @"Gap" : @5 }
                                                                           views:@{ @"Hurdie" : self.hurdieKeyboardButton, @"Ho" : self.hoKeyboardButton } ];
    [self.view addConstraints:buttonConstraints];
    
    NSLayoutConstraint* buttonSizes = [NSLayoutConstraint constraintWithItem:self.hurdieKeyboardButton
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:self.hoKeyboardButton
                                                                   attribute:NSLayoutAttributeWidth
                                                                  multiplier:1.0
                                                                    constant:0.0];
    [self.view addConstraint:buttonSizes];
    
    NSArray* hurdieHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-Edge-[Hurdie]-Edge-|"
                                                                    options:NSLayoutFormatAlignAllLeft
                                                                    metrics:@{ @"Edge" : @10 }
                                                                      views:@{ @"Hurdie" : self.hurdieKeyboardButton }];
    [self.view addConstraints:hurdieHeight];
    
    NSArray* hoHeight = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-Edge-[Ho]-Edge-|"
                                                                options:NSLayoutFormatAlignAllTop
                                                                metrics:@{ @"Edge" : @10 }
                                                                  views:@{ @"Ho" : self.hoKeyboardButton } ];
    [self.view addConstraints:hoHeight];
}

- (void)tapHurdie:(id)sender {
    [self.textDocumentProxy insertText:@"Hurdie"];
}

- (void)tapHo:(id)sender {
    [self.textDocumentProxy insertText:@"Ho"];
}

@end
