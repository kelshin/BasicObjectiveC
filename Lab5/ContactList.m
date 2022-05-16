//
//  ContactList.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
  self = [super init];
  if (self) {
    _list = [[NSMutableArray alloc] init];
  }
  return self;
}

- (void) addContact: (Contact *) newContact{
  [_list addObject:newContact];
  [_list sortUsingComparator:^NSComparisonResult(Contact *a, Contact *b) {
    return [a.name compare:b.name];
  }];
}

- (NSMutableArray *) list{
  NSMutableString *makeList = [[NSMutableString alloc] init];
  for (int i = 0; i < [_list count]; i++){
    Contact *c = [_list objectAtIndex:i];
    [makeList appendFormat:@"\n%i: <full name> (%@) <email> (%@)", i, [c name], [c email]];
  }
  NSLog(@"%@", makeList);
  return _list;
}

- (void) show: (NSInteger) index{
  if ( index < [_list count] && index >= 0){
    Contact *contact = [_list objectAtIndex:index];
    NSMutableString *num = [[NSMutableString alloc] init];
    if ([[[contact numbers] list] count] > 0){
      [num appendFormat:@"%@", [[contact numbers] list]];
    }
    NSLog(@"%ld: <full name> (%@) <email> (%@) %@", index, [contact name], [contact email], num);
  } else {
    NSLog(@"Not found");
  }
}

- (void) find: (NSString *) searchString{
  if ([searchString containsString:@"@"]){
    NSMutableArray *checkList = [[NSMutableArray alloc] init];
    [checkList setArray:_list];
    [checkList sortUsingComparator:^NSComparisonResult(Contact *a, Contact *b) {
      return [a.email compare:b.email];
    }];
    if ([[[_list objectAtIndex:0] email] isEqualToString:searchString]){
      NSLog(@"%@", [_list objectAtIndex:0]);
    return;
    }
    [self binarySearchEmail:checkList :0 :[checkList count] - 1 :searchString];
  } else {
    if ([[[_list objectAtIndex:0] name] isEqualToString:searchString]){
      NSLog(@"%@", [_list objectAtIndex:0]);
    return;
    }
    [self binarySearchName:_list :0 :[_list count] - 1 :searchString];
  }
}

- (NSString *) binarySearchName: (NSMutableArray *) arr :(NSInteger) left : (NSInteger) right : (NSString *) find{
  if (right >= left){
    NSInteger mid = left + (right - left) / 2;
    if ([[[arr objectAtIndex:mid] name] isEqualToString:find]){
      NSLog(@"%@", [arr objectAtIndex:mid]);
      return 0;
    }
    if ([[arr objectAtIndex:mid] name] > find){
      return [self binarySearchName:arr :left :mid - 1 :find];
    }
    return [self binarySearchName:arr :mid + 1 :right :find];
  }
  NSLog(@"Not Found");
  return 0;
}

- (NSString *) binarySearchEmail: (NSMutableArray *) arr :(NSInteger) left : (NSInteger) right : (NSString *) find{
  if (right >= left){
    NSInteger mid = left + (right - left) / 2;
    if ([[[arr objectAtIndex:mid] email] isEqualToString:find]){
      NSLog(@"%@", [arr objectAtIndex:mid]);
      return 0;
    }
    if ([[arr objectAtIndex:mid] email] > find){
      return [self binarySearchEmail:arr :left :mid - 1 :find];
    }
    return [self binarySearchEmail:arr :mid + 1 :right :find];
  }
  NSLog(@"Not Found");
  return 0;
}

- (BOOL) duplicateChecker: (NSString *) email{
  NSSet *set = [[NSSet setWithArray:[_list valueForKey:@"email"]]init];
  if ([set containsObject:email]){
    NSLog(@"Email already exist");
    return YES;
  }
  return NO;
}



@end
