//
//  InputCollector.m
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import "InputCollector.h"

@implementation InputCollector

- (instancetype)init
{
  self = [super init];
  if (self) {
    _history = [[NSMutableArray arrayWithCapacity:3] init];
  }
  return self;
}
- (NSString *) inputForPrompt:(NSString *)prompString {
  if ([prompString isEqualToString:@"menu"]){
    printf("What would you like to do next?\n");
    printf("new  - Create a new contact\n");
    printf("list - List all contacts\n");
    printf("show <id>- Show details of contact\n");
    printf("find <keyword> - Search for contacts\n");
    printf("history - list 3 previous command\n");
    printf("quit - Exit Application\n");
  }
  char inputChars[255];
  fgets(inputChars, 255, stdin);
  
  NSString *input = [[NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  [self logInput:input];
  return input;
}

- (NSString *) inputForNumberTitle {
  while (true) {
    NSLog(@"\nEnter a number of the title\n1. Home\n2. Mobile\n3. Work");
    
    char inputChar[255];
    fgets(inputChar, 255, stdin);
    
    NSString *input = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
    [self logInput:input];
    if ([input integerValue] >= 1 && [input integerValue] <= 3) {
      switch ([input integerValue]){
        case 1:
          return @"Home";
        case 2:
          return @"Mobile";
        default:
          return @"Work";
      }
    }
  }
}

- (NSString *) inputForNumber {
  while (true) {
    NSLog(@"Enter a number in XXX-XXX-XXXX format");
    
    char inputChar[255];
    fgets(inputChar, 255, stdin);
    
    NSString *number = [[NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self logInput:number];
    if ([self isNumeric:number]) {
      return number;
    }
    NSLog(@"Invalid Input");
  }
}

- (BOOL) isNumeric: (NSString *) string{
  NSCharacterSet *numericSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
  return [[string stringByTrimmingCharactersInSet:numericSet] length] == [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length];
}

- (void) logInput: (NSString *) input {
  if (![input isEqualToString:@"history"]){
  [_history insertObject:input atIndex:0];
  }
}

- (void) showHistory{
  NSMutableString *HistoryList = [[NSMutableString alloc] init];
  for (int i = 0; i < [_history count]; i++){
    if (i > 2){
      break;
    }
    NSString *c = [_history objectAtIndex:i];
    [HistoryList appendFormat:@"\n%@", c];
  }
  NSLog(@"%@", HistoryList);
}
@end
