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

#import "TOUIImageViewWithLoadingActivityIndicator.h"

@implementation TOUIImageViewWithLoadingActivityIndicator {
@private
    UIActivityIndicatorView *activityIndicator;
}

+(TOUIImageViewWithLoadingActivityIndicator*)imageViewWithFrame:(CGRect)frame {
    return [[TOUIImageViewWithLoadingActivityIndicator alloc] initWithFrame:frame];
}

+(TOUIImageViewWithLoadingActivityIndicator*)imageViewWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    return [[TOUIImageViewWithLoadingActivityIndicator alloc] initWithImage:image highlightedImage:highlightedImage];
}

#pragma mark -

-(void)sharedSetup {
    [self setBackgroundColor:[UIColor redColor]];
    [self updateLoadingSpinnerForImageState];    
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self sharedSetup];
    
    return self;
}

- (id)initWithImage:(UIImage *)image {
    self = [super initWithImage:image];
    
    [self sharedSetup];

    return self;
}

- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage {
    self = [super initWithImage:image highlightedImage:highlightedImage];
    
    [self sharedSetup];
    
    return self;    
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
    [activityIndicator setCenter:[super center]];
}

#pragma mark -

-(void)createActivityIndicatorIfNotAlreadyCreated {
    if(activityIndicator == nil) {
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:activityIndicator];
        [activityIndicator setCenter:[super center]];        
        [activityIndicator startAnimating];
        [self bringSubviewToFront:activityIndicator];
    }
}

-(void)removeActivityIndicator {
    if(activityIndicator) {
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
    }
}

-(void)updateLoadingSpinnerForImageState {
    if([self image] == nil) {
        [self createActivityIndicatorIfNotAlreadyCreated];
    } else {
        [self removeActivityIndicator];
    }
}

#pragma mark - 

-(void)setImage:(UIImage *)image {
    [super setImage:image];
    
    [self updateLoadingSpinnerForImageState];
}

@end
