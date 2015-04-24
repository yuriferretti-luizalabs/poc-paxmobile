//
//  ProductCollectionViewCell.m
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import "ProductCollectionViewCell.h"
#import "Product.h"


@interface ProductCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productValueLabel;


@end

@implementation ProductCollectionViewCell

+ (NSString *)reuseIdentifier {
    
    return @"ProductCollectionViewCell";
}


- (NSNumberFormatter *)numberFormatter {
    
    static NSNumberFormatter *formater = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formater = [NSNumberFormatter new];
        formater.locale = [NSLocale localeWithLocaleIdentifier:@"pt-BR"];
        formater.numberStyle = NSNumberFormatterCurrencyStyle;
    });
    
    return formater;
}

- (void)configureCellWithProduct:(Product *)product {
    
    self.productImageView.image = product.image;
    self.productNameLabel.text = product.name;
    self.productValueLabel.text = [[self numberFormatter]stringFromNumber:@(product.amount/100)];
}

@end
