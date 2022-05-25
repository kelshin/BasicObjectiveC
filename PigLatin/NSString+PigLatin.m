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

- (NSString *)pluralize: (NSString *) userInput {
  
  NSArray *wordsAndEmptyStrings = [userInput componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
  NSLog(@"%@",wordsAndEmptyStrings);
  
  NSArray *clusters = @[@"Ch", @"Sh", @"Sm", @"St", @"Th", @"Ps", @"Ph", @"Pl", @"Gl"];
  NSString *result = @"";
  NSMutableArray *resultArr = [NSMutableArray new];
  
  for (NSString* word in wordsAndEmptyStrings) {
    NSRange checkRange = NSMakeRange(0, 2);
    NSString *string = @"";
    string = [word substringWithRange:checkRange];
    NSLog(@"%@", word);
    
    if ([clusters containsObject:string]) {
      result = [NSString stringWithFormat:@"%@%@%@ay",[[word substringWithRange:NSMakeRange(2,3)]uppercaseString], [word substringWithRange:NSMakeRange(1, [word length] - 1)], string];
      [resultArr addObject:result];
    } else {
      result = [NSString stringWithFormat:@"%@%@%@ay",[[word substringWithRange:NSMakeRange(1,2)]uppercaseString], [word substringWithRange:NSMakeRange(1, [word length])], [word substringWithRange:NSMakeRange(0, 1)]];
      [resultArr addObject:result];
    }
    
  }
  return [resultArr componentsJoinedByString:@","];
}

@end
