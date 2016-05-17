//
//  PNPublishWithCompressionTestCase.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <PubNub_Testing/PubNubTesting.h>

@interface PNPublishWithCompressionTestCase : PNTClientTestCase

@end

@implementation PNPublishWithCompressionTestCase

- (BOOL)isRecording {
    return NO;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSString *)publishChannel {
    return @"a";
}

- (void)testPublishStringWithCompression {
    [self.client publish:@"test" toChannel:self.publishChannel compressed:YES withCompletion:[self PNT_successfulPublishCompletionWithExpectedTimeToken:@14613497214576406]];
    [self waitFor:kPNTPublishTimeout];
}

- (void)testPublishStringWithNoCompression {
    [self.client publish:@"test" toChannel:self.publishChannel compressed:NO withCompletion:[self PNT_successfulPublishCompletionWithExpectedTimeToken:@14613497216762423]];
    [self waitFor:kPNTPublishTimeout];
}

@end
