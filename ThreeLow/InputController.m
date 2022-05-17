//
//  InputController.m
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import "InputController.h"

@implementation InputController

- (void) menu {
  NSLog(@"\n'roll' to roll the dice\n'hold' to hold a dice\n'reset' to un-hold all dice\n'done' to end the game\n'display' to show the current state");
}

- (NSString *) getInput{
  char inputChar[255];
  
  fgets(inputChar, 255, stdin);
  
  return [[NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
