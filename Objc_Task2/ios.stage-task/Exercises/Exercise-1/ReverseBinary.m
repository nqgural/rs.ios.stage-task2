#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {

    // INT TO BINARY
    int bin = 0, k = 1;
    while (n)
    {
        bin += (n % 2) * k;
        k *= 10;
        n /= 2;
    }
    
    // CREATING STRING
    
    NSMutableString *binString = [[@(bin) stringValue]mutableCopy];
    if ([binString length] < 8) {
        while ([binString length] < 8) {
            [binString insertString:@"0" atIndex:0];
        }
    }
    

    
    
    // REVERSING BINSTRING

    NSMutableString *binStringReversed = [NSMutableString string];
    int position = (((int)[binString length])-1);
    while (position!=-1) {
        [binStringReversed appendString: [binString substringFromIndex:position]];
        binString = (NSMutableString*)[binString substringToIndex:position];
        position--;
    }

    
    // BIN TO INT
    
    int finalNum = 0;
    double power = (double)([binStringReversed length]-1);
    int temp = (int)[binStringReversed length];
    for (int i = 0; i < temp; i++) {
        finalNum = finalNum + ([[binStringReversed substringToIndex:1]intValue] * pow(2, power));
        binStringReversed = (NSMutableString*)[binStringReversed substringFromIndex:1];
        power--;
    }
    
    
    
    
    return (UInt8)finalNum;
}
