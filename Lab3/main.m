//
//  main.m
//  Lab3
//
//  Created by Kelbin David on 2022-05-11.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "InputHandler.h"
#import "ScoreKeeper.h"
#import "QuestionFactory.h"
#import "QuestionManager.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSLog(@"MATHS!");
    BOOL gameOn = YES;
    ScoreKeeper *scores = [ScoreKeeper new];
    QuestionFactory *questionFactory = [QuestionFactory new];
    QuestionManager *questionManager = [[QuestionManager alloc] init];
    InputHandler *getInput = [InputHandler new];
    while (gameOn) {
      Question *q1 = [[NSClassFromString([questionFactory generateRandomQuestion]) alloc] init];
      [questionManager addNewQuestion:q1];
//      NSLog(@"%ld",(long)[q1 answer]);
      NSString *ans = [getInput getInput];
      if ([ans integerValue] == q1.answer) {
        NSLog(@"Right!");
        [scores setRight:[scores right] + 1];
      } else if ([ans isEqualToString: @"quit"]) {
        gameOn = NO;
      } else {
        NSLog(@"Wrong!");
        [scores setWrong:[scores wrong] + 1];
      }
      [scores log];
      NSLog(@"%@", [questionManager timeOutput]);
    }
  }
  return 0;
  
}




