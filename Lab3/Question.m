//
//  Question.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import "Question.h"

@implementation Question

- (instancetype)init
{
  self = [super init];
  if (self) {
    NSInteger v1 = arc4random_uniform(100);
    NSInteger v2 = arc4random_uniform(100);
    _leftValue = v1;
    _rightValue = v2;
    _question = [NSString stringWithFormat:@"%ld + %ld ?", v1, v2];
    _answer = v1 + v2;
    _startTime = [NSDate date];
  }
  return self;
}

- (void) generateQuestion {
}

// override getter

- (NSInteger)answer{
  _endTime = [NSDate date];
  return _answer;
}

- (NSTimeInterval)answerTime{
  return [_endTime timeIntervalSinceDate:_startTime];
}

@end
