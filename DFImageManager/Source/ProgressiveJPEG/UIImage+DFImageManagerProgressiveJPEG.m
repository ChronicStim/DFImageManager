// The MIT License (MIT)
//
// Copyright (c) 2015 Alexander Grebenyuk (github.com/kean).
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "UIImage+DFImageManagerProgressiveJPEG.h"
#import <DFJPEGTurbo/DFJPEGTurboImageDecoder.h>

@implementation UIImage (DFImageManagerProgressiveJPEG)

+ (BOOL)df_isJPEGData:(NSData *)data {
    if (data.length < 2) {
        return NO;
    }
    // See https://en.wikipedia.org/wiki/List_of_file_signatures
    uint8_t h1[2];
    [data getBytes:&h1 length:2];
    return h1[0] == 0xFF && h1[1] == 0xD8;
}

+ (UIImage *)df_imageWithJPEGData:(NSData *)data {
    return [DFJPEGTurboImageDecoder imageWithData:data];
}

@end
