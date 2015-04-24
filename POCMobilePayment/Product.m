//
//  Product.m
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import "Product.h"

@interface Product ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (assign, nonatomic, readwrite) NSInteger amount;
@property (strong, nonatomic, readwrite) UIImage *image;

@end

@implementation Product


- (instancetype)initWithName:(NSString *)name amount:(NSInteger)amount image:(UIImage *)image; {
    
    self = [super init];
    
    if (self) {
        
        self.name = name;
        self.amount = amount;
        self.image = image;
    }
    
    return self;
}



@end
