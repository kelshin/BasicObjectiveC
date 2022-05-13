//
//  DivisionQuestion.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import "DivisionQuestion.h"

@implementation DivisionQuestion

- (instancetype)init
{
  self = [super init];
  if (self) {
    [self generateQuestion];
  }
  return self;
}
- (void) generateQuestion {
  [super setAnswer:[super leftValue] / [super rightValue]];
  [super setQuestion:[NSString stringWithFormat:@"%ld / %ld ? (round off)", [super leftValue], [super rightValue]]];
  NSLog(@"%ld / %ld ? (round off)", [super leftValue], [super rightValue]);
}

@end
