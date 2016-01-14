//
//  ViewController.m
//  Taschenrechner
//
//  Created by Franziska Schmidt on 06.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"

@interface CalculatorViewController ()

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (strong, nonatomic) Calculator *calculator;

@end

@implementation CalculatorViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        
        self.calculator = [[Calculator alloc]init];
    }
    return aDecoder;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.outputLabel.font   = [UIFont fontWithName:@"DB LCD Temp" size:26];
    
    [self.calculator addObserver:self forKeyPath:@"display"
                         options:NSKeyValueObservingOptionNew |
                         NSKeyValueObservingOptionInitial
                         context:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc {
    [self.calculator removeObserver:self forKeyPath:@"display"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if( object == self.calculator && [keyPath isEqualToString:@"display"]){
        self.outputLabel.text = self.calculator.display;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
