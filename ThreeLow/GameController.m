//
//  GameController.m
//  ThreeLow
//
//  Created by Kelbin David on 2022-05-16.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
  self = [super init];
  if (self) {
    _game = YES;
    _enableRoll = YES;
    _lowestScore = INTMAX_MAX;
    _rolls = 5;
    _dices = [NSMutableArray arrayWithObjects:[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init], nil];
    _heldDices = [NSMutableArray arrayWithObjects:@NO, @NO, @NO, @NO, @NO, nil];
  }
  return self;
}

- (void) roll {
  if (_rolls > 0 && _enableRoll ) {
    _rolls -= 1;
    _enableRoll = !_enableRoll;
    for (int i = 0; i < [_dices count]; i++){
      if ([[_heldDices objectAtIndex:i] isEqual:@NO]){
        [[_dices objectAtIndex:i] rerollDice];
      }
    }
  } else {
    NSLog(@"You need to make a hold or unhold action");
  }
  if (_rolls == 0){
    [self setGame:NO];
  } else {
    [self display];
  }
}

- (void) holdDice :(NSInteger) index {
  _enableRoll = YES;
    [_heldDices setObject:@(![[_heldDices objectAtIndex:index - 1] boolValue]) atIndexedSubscript:index - 1];
  [self display];
}

- (NSMutableArray *) heldDices {
  NSMutableString *displayDices = [[NSMutableString alloc] init];
  for (int i = 0; i < [_heldDices count]; i++ ){
    [displayDices appendFormat:@"[%@]", [_heldDices objectAtIndex:i]];
  }
  NSLog(@"%@", displayDices);
  [self display];
  return _heldDices;
}

- (void) resetDice {
  [_heldDices setArray:[NSMutableArray arrayWithObjects:@NO, @NO, @NO, @NO, @NO, nil]];
  [self display];
}

- (void) remainingRolls{
  NSLog(@"Remaining rolls: %ld", _rolls);
}

- (NSMutableArray *) dices {
  NSMutableString *displayDices = [[NSMutableString alloc] init];
  for (int i = 0; i < [_dices count]; i++ ){
    if ([[_heldDices objectAtIndex:i]  isEqual: @YES]){
      [displayDices appendFormat:@"[%@] ", [_dices objectAtIndex:i]];
    } else {
    [displayDices appendFormat:@" %@  ", [_dices objectAtIndex:i]];
    }
  }
  NSLog(@"%@", displayDices);
  return _dices;
}

- (NSInteger) totalDice {
  NSInteger sum = 0;
  for (int i = 0; i < [_dices count]; i++){
    if ([[_heldDices objectAtIndex:i]  isEqual: @YES] && [[_dices objectAtIndex:i] dice] != 3){
      sum += [[_dices objectAtIndex:i] dice];
    }
  }
  NSLog(@"Score: %ld", (long)sum);
  return sum;
}

- (void) display {
  [self remainingRolls];
  NSLog(@"------------------");
  NSLog(@"-- Current Dice --");
  [self dices];
  NSLog(@"-- Total Score  --");
  [self totalDice];
  if (_lowestScore != INTMAX_MAX) {
    NSLog(@"Score to beat: %ld", _lowestScore);
  }
  NSLog(@"------------------");
}

- (void) end {
  [_heldDices setArray:[NSMutableArray arrayWithObjects:@YES,@YES,@YES,@YES,@YES,nil]];
  [self remainingRolls];
  NSLog(@"GAME OVER");
  [self setGame:NO];
  [self display];
  NSLog(@"\n'new' - new game to beat your score\n'quit' - to exit");
  while (true) {
    char inputChars[255];
    fgets(inputChars, 255, stdin);
    NSString *input = [[NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([input isEqualToString:@"new"]){
      [self newGame];
      break;
    } else if ([input isEqualToString:@"quit"]){
      break;
    } else {
      NSLog(@"Invalid Input");
    }
  }
  
}

- (void) newGame {
  _enableRoll = YES;
  if (!_game){
    NSInteger currentScore = [self totalDice];
    if (currentScore < _lowestScore){
      _lowestScore = currentScore;
    }
  }
  _game = YES;
  _rolls = 5;
  _dices = [NSMutableArray arrayWithObjects:[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init],[[Dice alloc] init], nil];
  _heldDices = [NSMutableArray arrayWithObjects:@NO, @NO, @NO, @NO, @NO, nil];
}

@end
