//
//  PaymentGateway.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import "PaymentGateway.h"

@implementation PaymentGateway

- (void) processPaymentAmout: (NSInteger) amount{
  if ([self.delegate canProcessPayment]) {
    [self.delegate processPaymentAmount:amount];
  }
}

@end
