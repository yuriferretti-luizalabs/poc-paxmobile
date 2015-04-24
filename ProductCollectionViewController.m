//
//  ProductCollectionViewController.m
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import "ProductStore.h"
#import "Product.h"
#import "Transaction.h"
#import "StoneSDK.h"

@interface ProductCollectionViewController () <UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) ProductStore *productStore;

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    UINib *productNib = [UINib nibWithNibName:@"ProductCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:productNib forCellWithReuseIdentifier:[ProductCollectionViewCell reuseIdentifier]];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(transactionSucceeded:) name: TransactionDidProccessNotification object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy instantiation

- (ProductStore *)productStore {
    if (!_productStore) {
        _productStore = [ProductStore testProductStore];
    }
    return _productStore;
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.productStore.products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[ProductCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    [cell configureCellWithProduct:self.productStore.products[indexPath.row]];
    [cell.buyButton addTarget:self action:@selector(buyProduct:) forControlEvents:UIControlEventTouchUpInside];
    cell.buyButton.tag = indexPath.row;
    
    return cell;
}

#pragma mark - Actions

- (void)buyProduct:(UIButton *)button {
    
    Product *product = self.productStore.products[button.tag];
    Transaction *transaction = [[Transaction alloc]initWithProducts:@[product] installments:1 type:TransactionTypeCredit];
    [transaction processTransaction];
}

- (void)transactionSucceeded: (NSNotification *)notification {
    
    StoneSDK *stone = notification.userInfo[@"object"];

    if (!stone) return;

    NSString *message = nil;
    
    if ([stone.str_Status isEqualToString: TransactionStatusApproved]) {
        
        message = @"Transação efetuada com sucesso!";
    
    } else {
        
        message = @"Ocorreu um erro ao processar a transação";
    }
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Status" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

#pragma mark <UICollectionViewDelegate>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat interItemPadding = 10.0;
    return CGSizeMake((screenWidth / 2.0) - interItemPadding, 240);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(30, 0, 20, 0);
}


@end
