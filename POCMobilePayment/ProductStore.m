//
//  ProductStore.m
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import "ProductStore.h"
#import "Product.h"

@implementation ProductStore


+ (ProductStore *)testProductStore {
 
    ProductStore *store = [ProductStore new];
    store.products = [self testProducts];
    return store;
}

+ (NSArray *)testProducts {
    
    NSArray *products = @[
        
        [[Product alloc]initWithName:@"TV" amount:199999 image:[UIImage imageNamed:@"tv.jpg"]],
        [[Product alloc]initWithName:@"Secador" amount:8999 image:[UIImage imageNamed:@"secador.jpg"]],
        [[Product alloc]initWithName:@"Carabina" amount:250000 image:[UIImage imageNamed:@"awp.jpg"]],
        [[Product alloc]initWithName:@"Pen drive" amount:1 image:[UIImage imageNamed:@"pendrive.jpg"]]
    ];
    
    return products;
}



@end
