//
//  Box.m
//  Lab2
//
//  Created by Kelbin David on 2022-05-10.
//

#import "Box.h"

@implementation Box

- (instancetype)initWithHeight: (CGFloat) height andWidth: (CGFloat) width andLength: (CGFloat) length
{
  self = [super init];
  if (self) {
    _height = height;
    _width = width;
    _length = length;
  }
  return self;
}

- (CGFloat)volume {
  return _length * _width * _height;
}

- (void)insertThisBoxInside: (Box *) inside {
  if ([self volume] > [inside volume]) {
    CGFloat result = [self volume] / [inside volume];
    NSLog(@"Number of boxes can fit inside: %f", result);
  } else {
    NSLog(@"It is too big to fit inside");
  }
}

@end
