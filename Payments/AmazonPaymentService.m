//
//  AmazonPaymentService.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import "AmazonPaymentService.h"

@implementation AmazonPaymentService

- (NSInteger)processPaymentAmount:(NSInteger) amount {
  NSLog(@"Amazon processed amount $%ld", amount);
  return 0;
}

- (BOOL)canProcessPayment {
  if (arc4random_uniform(2) == 1) { return YES; }
  return NO;
}


@end
