//
//  ViewController.m
//  FaceBoardDome
//
//  Created by blue on 12-12-20.
//  Copyright (c) 2012年 Blue. All rights reserved.
//  Email - 360511404@qq.com
//  http://github.com/bluemood
//

#import "ViewController.h"

@interface ViewController ()

@property (assign, nonatomic) BOOL faceBoardShow;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _faceBoard = [[FaceBoard alloc]init];
    _faceBoard.inputTextView = self.textView;
    [self.textView becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textView release];
    [_faceBoard release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTextView:nil];
    [_faceBoard release];
    _faceBoard = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [super viewDidUnload];
}
- (IBAction)faceBoardClick:(id)sender {
    [self.textView resignFirstResponder];
}

- (void)keyboardDidHide:(NSNotification *)notification {
    if (self.faceBoardShow) {
        self.textView.inputView = nil;
    } else {
        self.textView.inputView = _faceBoard;
    }
    [self.textView becomeFirstResponder];
}

- (void)keyboardDidShow:(NSNotification *)notification{
    if (!self.textView.inputView) {
        self.faceBoardShow = NO;
    } else {
        self.faceBoardShow = YES;
    }
}

@end
