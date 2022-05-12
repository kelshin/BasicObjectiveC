//
//  main.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"MATHS!");
    BOOL gameOn = YES;
    ScoreKeeper *scores = [ScoreKeeper new];
    while (gameOn) {
      AdditionQuestion *a1 = [AdditionQuestion new];
      NSLog(@"%@", a1.question);
      InputHandler *getInput = [InputHandler new];
      NSString *ans = [getInput getInput];
      if ([ans integerValue] == a1.answer) {
        NSLog(@"Right!");
        [scores addRight];
      } else if ([ans isEqualToString: @"quit"]) {
        gameOn = NO;
      } else {
        NSLog(@"Wrong!");
        [scores addWrong];
        [scores setRight:[scores right] + 1];
      }
      [scores log];
    }
  }
  return 0;
}
