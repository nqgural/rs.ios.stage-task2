#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *numbersArray = [NSMutableArray array];
    NSMutableArray *stringsArray = [NSMutableArray array];
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSArray *i in array) {
        if ([i isKindOfClass:NSArray.class]) {
            for (NSArray *j in i) {
                if ([ j isKindOfClass:NSNumber.class])  {
                    [numbersArray addObject:j];
                } else {
                    [stringsArray addObject:j];
                }
            }
        } else {
            return @[];
        }
    }
    
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [numbersArray sortUsingDescriptors:[NSArray arrayWithObject:lowestToHighest]];
    
    NSSortDescriptor *valueDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"description" ascending:YES];
    NSArray *sortedStringsArray = [stringsArray sortedArrayUsingDescriptors:@[valueDescriptor]];
    
    if (![numbersArray isEqualToArray:@[]] && ![sortedStringsArray isEqualToArray:@[]]) {
        [resultArray addObject:numbersArray];
        [resultArray addObject:sortedStringsArray];
    } else if (![numbersArray isEqualToArray:@[]]) {
        [resultArray addObjectsFromArray:numbersArray];
    } else if (![sortedStringsArray isEqualToArray:@[]]) {
        [resultArray addObjectsFromArray:sortedStringsArray];
    }
    
    return resultArray;
}

@end
