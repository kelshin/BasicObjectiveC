//
//  PaymentGateway.h
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import <Foundation/Foundation.h>

@protocol PaymentDelegate <NSObject>

- (NSInteger) processPaymentAmount:(NSInteger) amount;
- (BOOL) canProcessPayment;

@end

NS_ASSUME_NONNULL_BEGIN

@interface PaymentGateway : NSObject

@property (nonatomic, weak) id <PaymentDelegate> delegate;
- (void) processPaymentAmout: (NSInteger) amount;

@end

NS_ASSUME_NONNULL_END
