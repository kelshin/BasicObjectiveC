//
//  GameController.h
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameController : NSObject

@property (nonatomic, readwrite) BOOL game;
@property (nonatomic, readwrite) BOOL enableRoll;
@property (nonatomic, readwrite) NSInteger lowestScore;
@property (nonatomic, readwrite) NSInteger rolls;
@property (nonatomic, readwrite) NSMutableArray *dices;
@property (nonatomic, readwrite) NSMutableArray *heldDices;

- (void) holdDice :(NSInteger) index;
- (void) resetDice;
- (void) roll;
- (void) display;
- (void) end;
- (void) newGame;

@end

NS_ASSUME_NONNULL_END
