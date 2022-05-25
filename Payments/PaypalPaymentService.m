//
//  PaypalPaymentService.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import "PaypalPaymentService.h"


@implementation PaypalPaymentService

- (NSInteger)processPaymentAmount:(NSInteger) amount {
  NSLog(@"Paypal processed amount $%ld", amount);
  return 0;
}

- (BOOL)canProcessPayment {
  if (arc4random_uniform(2) == 1) {
    return YES; }
  return NO;
}


@end
