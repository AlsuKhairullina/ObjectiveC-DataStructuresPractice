//
//  Network.m
//  ObjCPractice
//
//  Created by Алсу Хайруллина on 26.11.2024.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"https://jsonplaceholder.typicode.com/posts"];
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error while trying fetch data: %@", error.localizedDescription);
                return;
            }
            
            NSError *jsonError = nil;
            NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingAllowFragments
                                                                    error:&jsonError];
            
            if (jsonError) {
                NSLog(@"Error while trying map JSON: %@", jsonError.localizedDescription);
                return;
            }
            
            NSLog(@"Parsed data: %@", jsonArray);
        }];
        
        [task resume];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
