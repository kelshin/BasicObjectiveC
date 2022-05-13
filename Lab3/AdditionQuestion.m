//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self generateQuestion];
  }
  return self;
}
- (void) generateQuestion {
  [super setAnswer:[super leftValue] + [super rightValue]];
  [super setQuestion:[NSString stringWithFormat:@"%ld + %ld ?", [super leftValue], [super rightValue]]];
  NSLog(@"%ld + %ld ?", [super leftValue], [super rightValue]);
}

@end
