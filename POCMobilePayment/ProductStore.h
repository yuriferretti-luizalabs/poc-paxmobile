//
//  ProductStore.h
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductStore : NSObject

@property (strong, nonatomic) NSArray *products;

+ (ProductStore *)testProductStore;

@end
