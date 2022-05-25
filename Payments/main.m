//
//  main.m
//  Payments
//
//  Created by Kelbin David on 2022-05-24.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "AmazonPaymentService.h"
#import "StripePaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSInteger randNum = 100 + arc4random_uniform(900);
    NSLog(@"\nThank you for shopping at surf.com Your total today is $%ld Please select your payment method: \n1: Paypal 2: Stripe 3: Amazon 4. Apple Pay", (long)randNum);
    
    char inputChar[255];
    fgets(inputChar, 255, stdin);
    
    NSInteger userInput = [[[NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue];
    
    NSLog(@"Input %ld", userInput);
    PaymentGateway *paymentMethod = [PaymentGateway new];
    
    switch (userInput){
      case 1 : {
        PaypalPaymentService *paypal = [PaypalPaymentService new];
        paymentMethod.delegate = paypal;
        [paymentMethod processPaymentAmout:randNum];
        break;
      }
      case 2 : {
        StripePaymentService *stripe = [StripePaymentService new];
        paymentMethod.delegate = stripe;
        [paymentMethod processPaymentAmout:randNum];
        break;
      }
      case 3 : {
        AmazonPaymentService *amazon = [AmazonPaymentService new];
        paymentMethod.delegate = amazon;
        [paymentMethod processPaymentAmout:randNum];
        break;
      }
      case 4 : {
        AmazonPaymentService *amazon = [AmazonPaymentService new];
        paymentMethod.delegate = amazon;
        [paymentMethod processPaymentAmout:randNum];
        break;
      }
      default:
        NSLog(@"Invalid Input");
    }
    
    
  }
  return 0;
}
