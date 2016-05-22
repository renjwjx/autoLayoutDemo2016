//
//  ViewController.m
//  autoLayoutDemo
//
//  Created by jinren on 5/16/16.
//  Copyright © 2016 jinren. All rights reserved.
//

#import "ViewController.h"


#define     TEXTVIEW_HEIGHT_MAX    200
#define     TEXTVIEW_HEIGHT_MIN     60

@interface ViewController ()<UITextViewDelegate>


@property (strong, nonatomic) UILabel *labelTo;
@property (strong, nonatomic) UITextField *textTo;

@property (strong, nonatomic) UITextView *textViewContent;
@property (strong, nonatomic) UITextView *textViewNote;
@property (strong, nonatomic) NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) NSLayoutConstraint *heightConstraintMin;
@property (strong, nonatomic) NSLayoutConstraint *heightConstraintMax;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.labelTo];
    [self.view addSubview:self.textTo];
    [self.view addSubview:self.textViewContent];
    [self.view addSubview:self.textViewNote];

    self.labelTo.layer.borderWidth = 1.0;
    self.labelTo.layer.borderColor = [UIColor redColor].CGColor;

    self.textTo.layer.borderWidth = 1.0;
    self.textTo.layer.borderColor = [UIColor redColor].CGColor;

    self.textViewContent.layer.borderWidth = 1.0;
    self.textViewContent.layer.borderColor = [UIColor redColor].CGColor;
   
    self.textViewNote.layer.borderWidth = 1.0;
    self.textViewNote.layer.borderColor = [UIColor redColor].CGColor;
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:20]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10]];

    //topic autolayout
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.labelTo attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textTo attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textTo attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10] ];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textTo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.labelTo attribute:NSLayoutAttributeRight multiplier:1.0 constant:10.0f]];
    
    //text content
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewContent attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textTo attribute:NSLayoutAttributeBottom multiplier:1.0 constant:2]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewContent attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewContent attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
  
    self.heightConstraintMin = [NSLayoutConstraint constraintWithItem:self.textViewContent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:TEXTVIEW_HEIGHT_MIN];
    
    self.heightConstraintMax = [NSLayoutConstraint constraintWithItem:self.textViewContent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:TEXTVIEW_HEIGHT_MAX];
    
    //autolayout 是从上到下，所以中间的view是贪婪算法，如果只有greater，height一直到了最下面, 必须有less约束。成对使用。
    [self.view addConstraint:self.heightConstraintMax];
    [self.view addConstraint:self.heightConstraintMin];
    
    //text note
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewNote attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.textViewContent attribute:NSLayoutAttributeBottom multiplier:1.0 constant:2]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewNote attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:TEXTVIEW_HEIGHT_MIN]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewNote attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-2.0f]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewNote attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.textViewNote attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0]];
    
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoHeighterFrame) userInfo:nil repeats:YES];
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
        _textTo = [[UITextField alloc] initWithFrame:CGRectZero];
        _textTo.text = @"please input text here";
        _textTo.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textTo;
}

- (UITextView *)textViewContent
{
    if (_textViewContent == nil) {
        _textViewContent = [[UITextView alloc] initWithFrame:CGRectZero];
        _textViewContent.text = @"content View";
        _textViewContent.translatesAutoresizingMaskIntoConstraints = NO;
        _textViewContent.delegate = self;
    }
    return _textViewContent;
}

- (UITextView *)textViewNote
{
    if (_textViewNote == nil) {
        _textViewNote = [[UITextView alloc] initWithFrame:CGRectZero];
        _textViewNote.text = @"content Note View";
        _textViewNote.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _textViewNote;
}

- (void)autoHeighterFrame
{
    NSLog(@"frame: %@", [self.textViewContent description]);
    CGRect frame = self.textViewContent.frame;
    frame.size.height -= 20;
    //Note: descent the frame can not let the next view top to this view
//    self.textViewContent.frame = frame;
    //update contstant will update all view's position.
    self.heightConstraintMax.constant = frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSLog(@"%f", textView.contentSize.height);
    if (textView.contentSize.height > 130) {
        self.heightConstraintMax.constant = 130;
    } else {
        self.heightConstraintMin.constant = textView.contentSize.height;
    }
}

@end
