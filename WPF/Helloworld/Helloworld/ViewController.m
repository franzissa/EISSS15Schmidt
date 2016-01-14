//
//  ViewController.m
//  Helloworld
//
//  Created by Franziska Schmidt on 04.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;

@end

@implementation ViewController
- (IBAction)greetingsButtonTouched:(UIButton *)sender {
    NSString *name = self.nameTextField.text;
    NSString *greeting =[NSString stringWithFormat:@"Hello %@", name];
    self.greetingLabel.text = greeting;
    
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameTextField endEditing:YES];
    
    return NO;
    
}
- (IBAction)LabelSwipe:(id)sender {
    NSLog(@"Swipe");
}
- (IBAction)LabelTap:(id)sender {
    
    NSLog(@"Tap");
}


@end
