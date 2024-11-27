//
//  GreeterDelegate.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

// MARK: Greeter.h

@protocol GreeterDelegate <NSObject>
- (void)greet;
@end


@interface Greeter : NSObject <GreeterDelegate>
@end

// MARK: Greeter.m

@implementation Greeter
- (void)greet {
    NSLog(@"Hello world");
}
@end

// MARK: main

int delegateMain(int argc, const char * argv[]) {
    @autoreleasepool {
        Greeter *greeter = [[Greeter alloc] init];
        
        [greeter greet];
    }
    return 0;
}
