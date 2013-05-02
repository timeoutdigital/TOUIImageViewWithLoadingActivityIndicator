//
//  Created by Michael May on 30/04/2013.
//  Copyright (c) 2013 Michael May. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2013 Time Out Limited
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <SenTestingKit/SenTestingKit.h>

#import "TOUIImageViewWithLoadingActivityIndicator.h"

@interface TOUIImageViewWithLoadingActivityIndicatorTests : SenTestCase
@end


@implementation TOUIImageViewWithLoadingActivityIndicatorTests {
@private
    TOUIImageViewWithLoadingActivityIndicator *imageViewWithFrame;
    TOUIImageViewWithLoadingActivityIndicator *imageViewWithImageHighlightedImage;
}

- (void)setUp
{
    [super setUp];
    
    imageViewWithFrame = [TOUIImageViewWithLoadingActivityIndicator imageViewWithFrame:CGRectMake(10, 10, 10, 10)];
    imageViewWithImageHighlightedImage = [TOUIImageViewWithLoadingActivityIndicator imageViewWithImage:nil highlightedImage:nil];
}

- (void)tearDown
{
    imageViewWithFrame = nil;
    imageViewWithImageHighlightedImage = nil;
    
    [super tearDown];
}


NS_INLINE UIActivityIndicatorView *activityIndicatorInImageView(UIImageView* anImageView) {
    for(UIView *subview in [anImageView subviews]) {
        if([subview isKindOfClass:[UIActivityIndicatorView class]])
            return (UIActivityIndicatorView *)subview;
    }
    
    return nil;
}

NS_INLINE BOOL imageViewHasActivityIndicator(UIImageView* anImageView) {
    for(UIView *subview in [anImageView subviews]) {
        if([subview isKindOfClass:[UIActivityIndicatorView class]])
            return YES;
    }
    
    return NO;
}

-(void)testThatAnInstanceWithNoImageHasASpinner {
    // given
    
    // when
    
    // then
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithFrame), @"");
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithImageHighlightedImage), @"");
}

-(void)testThatAnInstanceWithAnImageHasNoSpinner {
    // given
    
    // when
    UIImage *image = [[UIImage alloc] init];
    [imageViewWithFrame setImage:image];
    [imageViewWithImageHighlightedImage setImage:image];
    
    // then
    STAssertFalse(imageViewHasActivityIndicator(imageViewWithFrame), @"");
    STAssertFalse(imageViewHasActivityIndicator(imageViewWithImageHighlightedImage), @"");
}

-(void)testThatAnInstanceWhichHasAnImageWhichIsSetToNilHasASpinner {
    // given
    UIImage *image = [[UIImage alloc] init];
    [imageViewWithFrame setImage:image];
    
    // when
    [imageViewWithFrame setImage:nil];
    [imageViewWithImageHighlightedImage setImage:nil];
    
    // then
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithFrame), @"");
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithImageHighlightedImage), @"");
}

-(void)testThatAnInstanceWhichHasJustAHighlightedImagelHasASpinner {
    // given
    
    // when
    UIImage *image = [[UIImage alloc] init];
    [imageViewWithFrame setHighlightedImage:image];
    [imageViewWithImageHighlightedImage setHighlightedImage:image];
    
    // then
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithFrame), @"");
    STAssertTrue(imageViewHasActivityIndicator(imageViewWithImageHighlightedImage), @"");
}

-(void)testThatAWithFrameInstanceWithAnIndicatorCorrectlyCentersThatIndicator {
    // given
    
    // when
    
    // then
    UIActivityIndicatorView *activityIndicator = activityIndicatorInImageView(imageViewWithFrame);
    STAssertTrue([activityIndicator center].x == [imageViewWithFrame center].x, @"");
    STAssertTrue([activityIndicator center].y == [imageViewWithFrame center].y, @"");
}

-(void)testThatAWithImageHighlightedImageInstanceWithAnIndicatorCorrectlyCentersThatIndicator {
    // given
    
    // when
    
    // then
    UIActivityIndicatorView *activityIndicator = activityIndicatorInImageView(imageViewWithImageHighlightedImage);
    STAssertTrue([activityIndicator center].x == [imageViewWithImageHighlightedImage center].x, @"");
    STAssertTrue([activityIndicator center].y == [imageViewWithImageHighlightedImage center].y, @"");
}

-(void)testThatAnInstanceWithAnIndicatorCorrectlyCentersThatIndicatorAfterTheFrameHasChanged {
    // given
    
    // when
    [imageViewWithFrame setFrame:CGRectMake(0, 0, 100, 100)];
    [imageViewWithFrame setFrame:CGRectMake(10, 10, 200, 200)];
    
    // then
    UIActivityIndicatorView *activityIndicator = activityIndicatorInImageView(imageViewWithFrame);
    STAssertTrue([activityIndicator center].x == [imageViewWithFrame center].x, @"");
    STAssertTrue([activityIndicator center].y == [imageViewWithFrame center].y, @"");
}

@end
