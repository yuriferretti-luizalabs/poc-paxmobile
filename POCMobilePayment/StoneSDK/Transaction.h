//
//  Transaction.h
//  POCMobilePayment
//
//  Created by Yuri Ferretti on 4/24/15.
//  Copyright (c) 2015 LuizaLabs. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const TransactionDidProccessNotification;

extern NSString * const TransactionStatusApproved;
extern NSString * const TransactionStatusDeclined;
extern NSString * const TransactionStatusPartialApproved;
extern NSString * const TransactionStatusTechinicalError;



typedef NS_ENUM(NSInteger, TransactionType) {
    TransactionTypeDebit = 0,
    TransactionTypeCredit = 1
};

@interface Transaction : NSObject

- (instancetype)initWithProducts:(NSArray *)products installments:(NSInteger)installments type:(TransactionType)type;

@property (assign, nonatomic, readonly) NSInteger        transactionIdentifer;
@property (assign, nonatomic, readonly) NSInteger       installments;
@property (assign, nonatomic, readonly) NSInteger       transactionAmount;
@property (assign, nonatomic, readonly) TransactionType transactionType;

- (void)processTransaction;


@end
