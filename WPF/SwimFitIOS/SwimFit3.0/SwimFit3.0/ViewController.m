//
//  ViewController.m
//  SwimFit3.0
//
//  Created by Franziska Schmidt on 07.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.Navigation @[@"Training" ,@"Coach" ,@"Facts" ,@"Pools" ,@"Open Water" ,@"Clubs" ,@"Competition" ,@"Training" ,@"Equipment"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.Navigation count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *SimpleIdentier = @"SimpleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleIdentier];
    
    if (cell == nil){
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentier];
    }
    
    self.textLabel.text = self.Navigation[indexPath.row];
}

@end
