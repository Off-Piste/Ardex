//
//  ADXSection.hpp
//  Ardex
//
//  Created by Harry Wright on 17.10.17.
//

#ifndef ADXSection_hpp
#define ADXSection_hpp

@class NSArray;

#include <stdio.h>

class ADXSection {
    public:
    NSInteger section;
    NSInteger items;
    NSArray *_Nonnull objects;
};

#endif /* ADXSection_hpp */
