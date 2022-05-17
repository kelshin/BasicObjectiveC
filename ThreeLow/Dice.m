//
//  Dice.m
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import "Dice.h"

@implementation Dice

- (instancetype)init
{
  self = [super init];
  if (self) {
    _dice = arc4random_uniform(6) + 1;
  }
  return self;
}

- (void) rerollDice {
  [self setDice:arc4random_uniform(6) + 1];
}

- (NSString *) description {
  switch (_dice){
    case 1:
      return @"⚀";
      break;
    case 2:
      return @"⚁";
      break;
    case 3:
      return @"⚂";
      break;
    case 4:
      return @"⚃";
      break;
    case 5:
      return @"⚄";
      break;
    default:
      return @"⚅";
      break;
  }
}

@end
