// AppsOnAirCoreServices.h

#import <Foundation/Foundation.h>

@interface AppsOnAirCoreServices : NSObject

@property (nonatomic, strong, readonly) NSString *appId;

- (void)initialize;
- (void)networkStatusListenerHandler:(void (^)(BOOL connected))handler;

@end
