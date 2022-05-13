//
//  QuestionFactory.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import "QuestionFactory.h"

@implementation QuestionFactory

- (instancetype)init
{
  self = [super init];
  if (self) {
    _questionSubclassNames = @[@"AdditionQuestion",@"SubtractionQuestion",@"MultiplicationQuestion",@"DivisionQuestion"];
  }
  return self;
}

- (NSString *) generateRandomQuestion {
  NSUInteger rand4 = arc4random_uniform((int)[_questionSubclassNames count]);
  return _questionSubclassNames[rand4];
}

@end
