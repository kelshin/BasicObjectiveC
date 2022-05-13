//
//  ScoreKeeper.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import "ScoreKeeper.h"

@implementation ScoreKeeper

- (instancetype)init
{
  self = [super init];
  if (self) {
    _right = 0;
    _wrong = 0;
  }
  return self;
}

- (void) addRight {
  _right = _right + 1;
}

- (void) addWrong {
  _wrong = _wrong + 1;
}

- (void) log {
  CGFloat ave = (long double)_right / (long double)(_right + _wrong);
  
  NSLog(@"Score: %ld right, %ld wrong --- %.0f%%", _right, _wrong, ave * 100 );
}

@end
