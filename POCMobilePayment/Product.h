//
//  Product.h
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Product : NSObject

- (instancetype)initWithName:(NSString *)name amount:(NSInteger)amount image:(UIImage *)image;

@property (strong, nonatomic, readonly) NSString *name;
@property (assign, nonatomic, readonly) NSInteger amount;
@property (strong, nonatomic, readonly) UIImage *image;


@end
