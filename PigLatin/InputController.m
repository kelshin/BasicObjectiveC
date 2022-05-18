//
//  InputController.m
//  PigLatin
//
//  Created by Kelbin David on 2022-05-18.
//

#import "InputController.h"

@implementation InputController

- (NSString *) getInput {
  char inputChars[255];
  
  fgets(inputChars, 255, stdin);
  
  return [[NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end
