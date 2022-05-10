//
//  main.m
//  Lab1
//
//  Created by Kelbin David on 2022-05-09.
//

#import <Foundation/Foundation.h>

// Function to get the user input
NSString *getUserInput(NSString *prompt){
  // 1. array of characters for the storage
  char inputChars[255];

  // get input in C
  NSLog(@"%@", prompt);
  fgets(inputChars, 255, stdin);
  
  // convert char to nsstring and remove whitespace
  NSString *str = [NSString stringWithUTF8String:inputChars];
  return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// Function to show menu and get input
NSInteger getMenuInput(NSString *prompt){
  // do infinite loop for menu choices
  while (true) {
    NSLog(@"%@",prompt);
    printf("1. Uppercase\n");
    printf("2. Lowercase\n");
    printf("3. Numberize\n");
    printf("4. Canadianize\n");
    printf("5. Respond\n");
    printf("6. De-Space-It\n");
    printf("7. Word Count\n");
    printf("8. Punctuation Removal\n");
    printf("9. Enter a new string\n");
    
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    
    
    NSString *menuChoice = [NSString stringWithUTF8String:inputChars];
    // length returns 2 if I enter only one character.
    if ([menuChoice length] == 2) {
      NSString *singleCharSubString = [menuChoice substringWithRange:NSMakeRange(0, 1)];
      // change value to NSInteger
      NSInteger picked = [singleCharSubString integerValue];
      if (picked >= 1 || picked <= 9) {
        return picked;
      }
    }
  }
}

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    while (true) {
      NSString *input = getUserInput(@"Enter your string: ");
      if ([input  isEqual: @"q"]) {
        break;
      } else {
        // create a mutable copy of my NSString input
        NSMutableString *mutatingString = [input mutableCopy];
        // while loop condition to go infinite loop
        BOOL loopMenu = YES;
        while (loopMenu) {
          NSInteger menuInput = getMenuInput(@"Enter number of choice: ");
          switch (menuInput){
            case 1:
              // change to uppercase
              NSLog(@"%@", [mutatingString uppercaseString]);
              break;
            case 2:
              // change to lowercase
              NSLog(@"%@", [mutatingString lowercaseString]);
              break;
            case 3:
              // change to NSInteger
              NSLog(@"%ld", (long)[mutatingString integerValue]);
              break;
            case 4:
              // append to the end
              NSLog(@"%@", [mutatingString stringByAppendingString:@", eh?"]);
              break;
            case 5: {
              // check last character if ? or !
              NSUInteger len = [mutatingString length];
              NSString *lastChar = [mutatingString substringFromIndex:len - 1];
              NSString *response = @"";
              if ([lastChar isEqualToString: @"?"]) {
                response = @"I don't know";
                } else if ([lastChar isEqualToString: @"!"]) {
                response = @"Whoa, calm down!";
                }
              NSLog(@"%@", response);
              break;
              }
            case 6: {
              // replace all " " with "-"
              NSLog(@"%@", [mutatingString stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
              break;
              }
            case 7:
              // count after spliting to get the number of words
              NSLog(@"%lu", (unsigned long)[[mutatingString componentsSeparatedByString: @" "] count]);
              break;
            case 8: {
              // create a set of characters to remove
              NSCharacterSet *punctutation = [NSCharacterSet characterSetWithCharactersInString:@"!?,.:;'"];
              // use set in componentsSeparatedByCharactersInSet
              NSLog (@"%@", [[mutatingString componentsSeparatedByCharactersInSet:punctutation] componentsJoinedByString: @""]);
              break;
            }
            case 9: {
              // get out of the while loop
              loopMenu = NO;
              break;
            }
          }
        }
      }
    }
  }
  return 0;
}
