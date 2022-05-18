//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Kelbin David on 2022-05-18.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

- (NSString *) pigLatin {
  NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
  NSMutableString *piglatin = [NSMutableString new];
  NSArray *splitted = [self componentsSeparatedByString:@" "];
  for (NSString *split in splitted) {
    NSInteger numOfChar = 1;
    if ( [clusters containsObject:[split substringToIndex:2]]){
      numOfChar = 2;
    }
    [piglatin appendString:[[[split substringFromIndex:numOfChar] stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[split substringWithRange:NSMakeRange(numOfChar, 1)] uppercaseString]] stringByAppendingFormat:@"%@ay ",[[split substringToIndex:numOfChar] lowercaseString]]];
  }
  return piglatin;
}
@end
