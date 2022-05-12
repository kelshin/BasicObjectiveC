//
//  InputHandler.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import "InputHandler.h"

@implementation InputHandler

- (NSString *)getInput {
  char inputChars[255];
  fgets(inputChars, 255, stdin);
  NSString *answer = [[NSString stringWithCString:inputChars encoding:NSASCIIStringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
  return answer;
}

@end
