//
//  Blocks.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

int blocksMain(int argc, const char * argv[]) {
    @autoreleasepool {
        int (^sumBlock)(int, int) = ^int(int a, int b) {
            return a + b;
        };
        
        int result = sumBlock(5, 7);
        
        NSLog(@"Sum: %d", result);
    }
    return 0;
}

