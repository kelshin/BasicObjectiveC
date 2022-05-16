//
//  ContactNumberDetails.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-14.
//

#import "ContactNumberDetails.h"

@implementation ContactNumberDetails

- (instancetype)initWithType: (NSString *) type andNumber: (NSString *) number
{
  self = [super init];
  if (self) {
    _type = type;
    _number = number;
  }
  return self;
}
@end
