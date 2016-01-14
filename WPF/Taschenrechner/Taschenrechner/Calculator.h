//
//  Calculator.h
//  Taschenrechner
//
//  Created by Franziska Schmidt on 06.01.16.
//  Copyright © 2016 Franziska Schmidt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    CalculaterOperatorAdd = 0,
    CalculaterOperatorSubtract,
    CalculaterOperatorMultiply,
    CalculaterOperatorDivide
    
    
} CalculaterOperator;

@interface Calculator : NSObject

@property (strong, nonatomic) NSString *display;

@property (assign, nonatomic) CalculaterOperator currentOperator;

- (void)addNumber : (NSInteger)number;
-(void)addDecimalOperator;


- (void)clear;
- (void)negate;
- (void)calculate;

@end
