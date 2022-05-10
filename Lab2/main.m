//
//  main.m
//  Lab2
//
//  Created by Kelbin David on 2022-05-10.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    Box *b1 = [[Box alloc] initWithHeight:5 andWidth:7 andLength:2];
    Box *b2 = [[Box alloc] initWithHeight:6 andWidth:7 andLength:3];
    NSLog(@"Volume is: %f", [b1 volume]);
    NSLog(@"Volume is: %f", [b2 volume]);
    [b1 insertThisBoxInside:b2];
  }
  return 0;
}
