//
//  main.m
//  PigLatin
//
//  Created by Kelbin David on 2022-05-18.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"
#import "InputController.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    InputController *userInput = [[InputController alloc] init];
    NSString *s = [userInput getInput];
    NSLog(@"%@", [s pigLatin]);
  }
  return 0;
}
