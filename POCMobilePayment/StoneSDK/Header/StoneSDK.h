#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface StoneSDK : NSObject


@property (nonatomic,strong)  NSString *str_amount;
@property (nonatomic,strong)  NSString *str_type;
@property (nonatomic,strong)  NSString *str_installments;
@property (nonatomic,strong)  NSString *str_idOrder;

@property (nonatomic,strong)  NSString *str_Acode;
@property (nonatomic,strong)  NSString *str_Arn;
@property (nonatomic,strong)  NSString *str_Status;
@property (nonatomic,strong)  NSString *str_Flag;
@property (nonatomic,strong)  NSString *str_Date;

- (id)init:(NSString *)xmlString;
- (void)sendPayment:(NSString *)amount transactionType:(NSString *)type installments:(NSString *)inst idTransaction:(NSString *)identification;
- (void)cancelOrder:(NSString *)acode;


@end
