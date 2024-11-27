//
//  GCD.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

int gcdMain(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"Hello from the background");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"UI Updated");
            });
        });
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    return 0;
}
