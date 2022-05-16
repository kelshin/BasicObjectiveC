//
//  ContactNumber.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-14.
//

#import "ContactNumber.h"

@implementation ContactNumber

- (instancetype)init
{
  self = [super init];
  if (self) {
    _list = [[NSMutableDictionary alloc] init];
  }
  return self;
}

- (void) addNumber: (ContactNumberDetails *) details{
  [_list setObject:[details number] forKey:[details type]];
}

@end
