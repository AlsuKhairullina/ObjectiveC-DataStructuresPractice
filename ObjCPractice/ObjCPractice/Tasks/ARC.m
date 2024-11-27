//
//  ARC.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

// MARK: Parent.h

@class Child;

@interface Parent : NSObject

@property (nonatomic, strong) Child *child;

@end

// MARK: Parent.m

@implementation Parent

@end

// MARK: Child.h

@class Parent;

@interface Child : NSObject

@property (nonatomic, weak) Parent *parent;

@end

// MARK: Child.m

@implementation Child

@end

// MARK: main

int arcMain(int argc, const char * argv[]) {
    @autoreleasepool {
        Parent *parent = [[Parent alloc] init];
        
        Child *child = [[Child alloc] init];
        
        parent.child = child;
        
        child.parent = parent;
    }
    return 0;
}
