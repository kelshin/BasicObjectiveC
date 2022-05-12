//
//  AdditionQuestion.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (instancetype)init
{
  self = [super init];
  if (self) {
    NSInteger v1 = arc4random_uniform(100);
    NSInteger v2 = arc4random_uniform(100);
    _question = [NSString stringWithFormat:@"%ld + %ld ?", v1, v2];
    _answer = v1 + v2;
  }
  return self;
}

@end
