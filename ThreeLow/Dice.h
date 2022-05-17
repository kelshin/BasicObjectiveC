//
//  Dice.h
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dice : NSObject

@property (nonatomic, readwrite) NSInteger dice;

- (void) rerollDice;

@end

NS_ASSUME_NONNULL_END
