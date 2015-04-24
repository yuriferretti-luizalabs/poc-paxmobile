//
//  Transaction.m
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import "Transaction.h"
#import "StoneSDK.h"

NSString * const TransactionDidProccessNotification = @"TransactionDidProccessNotification";

NSString * const TransactionStatusApproved        = @"APPR";
NSString * const TransactionStatusDeclined        = @"DECL";
NSString * const TransactionStatusPartialApproved = @"PART";
NSString * const TransactionStatusTechinicalError = @"TECH";


@interface Transaction ()

@property (assign, nonatomic, readwrite) NSInteger       transactionIdentifer;
@property (strong, nonatomic, readwrite) NSString        *transactionStatus;
@property (strong, nonatomic, readwrite) NSArray         *products;
@property (assign, nonatomic, readwrite) NSInteger       transactionAmount;
@property (assign, nonatomic, readwrite) NSInteger       installments;
@property (assign, nonatomic, readwrite) TransactionType transacitinType;

@end

@implementation Transaction

- (instancetype)initWithProducts:(NSArray *)products installments:(NSInteger)installments type:(TransactionType)type {

    self = [super init];
    
    if (self) {
        
        self.installments = installments;
        self.transacitinType = type;
        self.products = products;
        self.transactionAmount = [self amountForProducts];
        self.transactionIdentifer = [Transaction generateTransactionIdentifier];
    }
    
    return self;
}

- (NSInteger)amountForProducts {
    
    if (!self.products || self.products.count == 0) {
        return 0;
    }
    
    NSInteger amount = [[self.products valueForKeyPath:@"@sum.amount"]floatValue];
    
    return amount;
}

- (void)processTransaction {
    
    NSString *installments = [NSString stringWithFormat:@"%d", (int)self.installments];
    NSString *ammount = [NSString stringWithFormat:@"%d", (int)self.transactionAmount];
    NSLog(@"%@", ammount);
    NSString *transactionID = [NSString stringWithFormat:@"%d", (int)self.transactionIdentifer];
    NSString *transactionType = [NSString stringWithFormat:@"%d", (int)TransactionTypeCredit];
    StoneSDK *stone = [[StoneSDK alloc]init];
    [stone sendPayment:ammount transactionType:transactionType installments:installments idTransaction:transactionID];
}

+ (NSInteger)generateTransactionIdentifier {
    
    return arc4random_uniform(99999999);
}



@end
