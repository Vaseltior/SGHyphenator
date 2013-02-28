//
//  SGHyphenatorSpec.m
//  SGHyphenator
//
//  Created by Samuel Grau on 2/28/13.
//  Copyright (c) 2013 Samuel Grau. All rights reserved.
//

#import "Kiwi.h"
#import "SGHyphenator.h"

SPEC_BEGIN(SGHyphenatorSpec)

describe(@"The hyphenator", ^{
    SGHyphenator * hyphenator = [SGHyphenator sharedInstance];
    
    context(@"when created", ^{
    });
    
    context(@"after setting bad pattern", ^{
        it(@"should throw an exception for an unknown language file.", ^{
            [[theBlock(^{
                [hyphenator setPatternFile:@"hyphens_unknown"];
            }) should] raiseWithName:NSInvalidArgumentException];
        });
    });
    
    context(@"after setting a known pattern", ^{
        it(@"should not throw an exception for the french pattern file.", ^{
            [[theBlock(^{
                [hyphenator setPatternFile:@"hyphens_fr"];
            }) shouldNot] raiseWithName:NSInvalidArgumentException];
        });
    });

    context(@"after setting french pattern", ^{
        beforeEach(^{
            [hyphenator setPatternFile:@"hyphens_fr"];
        });
        it(@"ca-pu-cin has exactly 3 elements.", ^{
            [[[hyphenator hyphenate:@"capucin"] should] haveCountOf:3];
        });
        it(@"has exactly 3 elements.", ^{
            [[[hyphenator hyphenate:@"attention"] should] haveCountOf:3];
        });
        
        
    });
});

SPEC_END
