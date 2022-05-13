//
//  QuestionManager.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-12.
//

#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype)init
{
  self = [super init];
  if (self) {
    _questions = [NSMutableArray new];
    _timeSum = 0;
  }
  return self;
}

- (void) addNewQuestion:(Question *) newQuestion{
  [_questions addObject:newQuestion];
}

- (NSString *) timeOutput{
  NSInteger currentTime = [[_questions objectAtIndex:[_questions count] - 1] answerTime];
  _timeSum = _timeSum + currentTime;
  return [NSString stringWithFormat: @"total time: %lds, average time: %lds", currentTime, _timeSum / [_questions count]];
}

@end
