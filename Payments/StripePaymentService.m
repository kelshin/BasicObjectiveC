//
//  StripePaymentService.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

- (NSInteger)processPaymentAmount:(NSInteger) amount {
  NSLog(@"Stripe processed amount $%ld", amount);
  return 0;
}

- (BOOL)canProcessPayment {
  if (arc4random_uniform(2) == 1) { return YES; }
  return NO;
}


@end
