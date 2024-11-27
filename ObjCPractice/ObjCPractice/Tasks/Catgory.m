//
//  Catgory.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

// MARK: NSString+Reversed.h

@interface NSString (Reversed)

- (NSString *)reversedString;

@end

// MARK: NSString+Reversed.m

@implementation NSString (Reversed)

- (NSString *)reversedString {
    NSUInteger length = [self length];
    NSMutableString *reversed = [NSMutableString stringWithCapacity:length];
    
    for (NSInteger i = length - 1; i >= 0; i--) {
        unichar character = [self characterAtIndex:i];
        [reversed appendFormat:@"%C", character];
    }
    
    return reversed;
}

@end

// MARK: main

int categoryMain(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *originalString = @"Hello world";
        
        NSString *reversedString = [originalString reversedString];
        
        NSLog(@"Init string: %@", originalString);
        NSLog(@"Reversed string: %@", reversedString);
    }
    return 0;
}
