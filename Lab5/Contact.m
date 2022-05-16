//
//  Contact.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import "Contact.h"

@implementation Contact

- (instancetype)initWithName: (NSString *) name andEmail: (NSString *) email
{
  self = [super init];
  if (self) {
    _name = name;
    _email = email;
    _numbers = [[ContactNumber new] init];
  }
  return self;
}

- (NSString *) description {
  NSString *description = [[NSString alloc] init];
  if ([[_numbers list] count] > 0){
    description = [NSString stringWithFormat: @"\n<full name> %@\n<email> %@ \n<number> %@", _name, _email, [_numbers list]];
  } else {
    description = [NSString stringWithFormat: @"\n<full name> %@\n<email> %@", _name, _email];
  }
  NSLog(@"%@", [_numbers list]);
  return description;
}

@end
