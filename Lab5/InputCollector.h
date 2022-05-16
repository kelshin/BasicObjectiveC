//
//  InputCollector.h
//  Lab5
//
//  Created by Kelbin David on 2022-05-13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCollector : NSObject

@property (nonatomic, readwrite) NSMutableArray *history;

- (NSString *) inputForPrompt:(NSString *)prompString;
- (NSString *) inputForNumber;
- (NSString *) inputForNumberTitle;
- (BOOL) isNumeric: (NSString *) string;
- (void) showHistory;
- (void) logInput: (NSString *) input ;

@end

NS_ASSUME_NONNULL_END
