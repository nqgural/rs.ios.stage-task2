#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int counter = 0;

    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    [mutableArray sortUsingDescriptors:[NSArray arrayWithObject:highestToLowest]];
    
    if (array.count == 0 || array == nil) return 0;
    if (number.intValue == 0) {
        for (int i = 0; i<array.count; i++) {
            for (int j = i+1; j<array.count; j++) {
                if (i == j) continue;
                if ([[mutableArray objectAtIndex:i]intValue] == [[mutableArray objectAtIndex:j]intValue]) {
                    counter++;
                }
            }
        }
        return counter;
    }
    
    for (int i = 0; i<array.count; i++) {
        for (int j = 0; j<array.count; j++) {
            if (i == j) continue;
            if ([[mutableArray objectAtIndex:i]intValue] - [[mutableArray objectAtIndex:j]intValue] == [number intValue]) {
                counter++;
            }

        }
    }
    
    
    
    
    return counter;
    
    
    
}

@end
