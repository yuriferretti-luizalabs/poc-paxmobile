//
//  ProductCollectionViewCell.h
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Product;

@interface ProductCollectionViewCell : UICollectionViewCell

+ (NSString *)reuseIdentifier;

@property (weak, nonatomic) IBOutlet UIButton *buyButton;

- (void)configureCellWithProduct:(Product *)product;

@end
