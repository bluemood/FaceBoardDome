//
//  ViewController.h
//  FaceBoardDome
//
//  Created by blue on 12-12-20.
//  Copyright (c) 2012年 Blue. All rights reserved.
//  Email - 360511404@qq.com
//  http://github.com/bluemood
//

#import <UIKit/UIKit.h>
#import "FaceBoard.h"

@interface ViewController : UIViewController{
    FaceBoard *_faceBoard;
}
@property (retain, nonatomic) IBOutlet UITextView *textView;
- (IBAction)faceBoardClick:(id)sender;

@end
