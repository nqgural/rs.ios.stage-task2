#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSString *ipAdress = [NSString string];
    NSMutableArray *mutableNumbersArray = [NSMutableArray arrayWithArray:numbersArray];
    
    
    if ((int)[numbersArray count] > 4 || numbersArray == nil) {
        return @"";
    }
    
    // СHECK IF NUMBERS IN ARRAY ARE NEGATIVE OR NOT IN RANGE[0..255]
    for (NSNumber *i in numbersArray) {
        if ([i intValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        else if (!(NSLocationInRange([i intValue], NSMakeRange(0, (256 - 0))))) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
    }
    
    // ADDING 0 IF ARRAY COUNT < 4 AND NOT NIL
    if ((int)[numbersArray count] < 4) {
        while (([mutableNumbersArray count] != 4)) {
            [mutableNumbersArray addObject:@(0)];
        }
    }
    
    // CREATE STRING WITH IP ADRESS
    if (![numbersArray isEqualToArray:@[]]) {
        ipAdress = [mutableNumbersArray componentsJoinedByString:@"."];
        return ipAdress;
    } else {
        return @"";
    }
    
}

@end
