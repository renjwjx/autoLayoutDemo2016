//
//  ViewController.m
//  autoLayoutDemo
//
//  Created by jinren on 5/16/16.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (strong, nonatomic) UILabel *labelTo;
@property (strong, nonatomic) UITextField *textTo;

@property (strong, nonatomic) UITextView *textViewContent;
//@property (strong, nonatomic) UILabel *labelTopic;
//@property (strong, nonatomic) UITextField *textTopic;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.labelTo];
    [self.view addSubview:self.textTo];
    
    
    self.labelTo.layer.borderWidth = 1.0;
    self.labelTo.layer.borderColor = [UIColor redColor].CGColor;

    self.textTo.layer.borderWidth = 1.0;
    self.textTo.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:105]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:40]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:10]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];

    //text autolayout
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textTo attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textTo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:140]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textTo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10] ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textTo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.labelTo attribute:NSLayoutAttributeRight multiplier:1.0 constant:10.0f]];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoHeighterFrame) userInfo:nil repeats:YES];
}

- (UILabel *)labelTo
{
    if (_labelTo == nil) {
        _labelTo = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelTo.text = @"I'm a To Lable";
        _labelTo.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _labelTo;
}

- (UITextField *)textTo
{
    if (_textTo == nil) {
        _textTo = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        _textTo.text = @"please input text here";
        _textTo.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textTo;
}

- (UITextView *)textViewContent
{
    if (_textViewContent == nil) {
        _textViewContent = [[UITextView alloc] init];
        _textViewContent.text = @"content View";
    }
    return _textViewContent;
}

- (void)autoHeighterFrame
{
    NSLog(@"frame: %@", [self.textTo description]);
    CGRect frame = self.textTo.frame;
    frame.size.height += 20;
    self.textTo.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
