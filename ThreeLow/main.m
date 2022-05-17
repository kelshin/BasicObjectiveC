//
//  main.m
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputController.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    GameController *game = [[GameController alloc] init];
    InputController *input = [[InputController alloc] init];
    while ([game game] ) {
      [input menu];
      NSString *userInput = [input getInput];
      if ([userInput isEqualToString:@"roll"]){
        [game roll];
      } else if ([userInput isEqualToString:@"reset"]){
        [game resetDice];
      } else if ([userInput isEqualToString:@"hold"]){
        NSLog(@"Enter which dice");
        NSString *holdDice = [input getInput];
        [game holdDice:[holdDice integerValue]];
      } else if ([userInput isEqualToString:@"display"]){
        [game display];
      } else if ([userInput isEqualToString:@"done"]){
        [game end];
      } else {
        NSLog(@"Invalid Input");
      }
    }
  }
  return 0;
}
