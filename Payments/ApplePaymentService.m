//
//  ApplePaymentService.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import "ApplePaymentService.h"

@implementation ApplePaymentService

- (NSInteger)processPaymentAmount:(NSInteger) amount {
  NSLog(@"ApplePay processed amount $%ld", amount);
  return 0;
}

- (BOOL)canProcessPayment {
  if (arc4random_uniform(2) == 1) { return YES; }
  return NO;
}

@end
