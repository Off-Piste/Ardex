//
//  ADXDatasourceBase.m
//  Ardex
//
//  Created by Harry Wright on 16.10.17.
//

#import "ADXDatasourceBase.h"
#import "ADXObject.h"
#import "ADXSection.hpp"

#import <Ardex/Ardex-Swift.h>

@interface NSArray (Enumerator)

- (void)enumerateObjects:(void (^)(id _Nonnull, NSUInteger))block;

@end

@implementation NSArray (Enumerator)

- (void)enumerateObjects:(void (^)(id _Nonnull, NSUInteger))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        block(obj, idx);
    }];
}

@end

@interface NSValue (ADXSection)

+ (instancetype)valueWithSection:(ADXSection *)section;

- (ADXSection *)section;

@end

@implementation NSValue (ADXSection)

+ (instancetype)valueWithSection:(ADXSection *)section {
    return [self valueWithBytes:&section objCType:@encode(ADXSection)];
}

- (ADXSection *)section {
    ADXSection *section;
    [self getValue:&section];
    return section;
}

@end

static ADXSection *create_section_for_objects(NSArray *objects, int _section) {
    ADXSection *section = new ADXSection;
    section->section = _section;
    section->objects = objects;

    if ([objects isKindOfClass:[NSArray class]]) {
        section->items = [(NSArray *)objects count];
    } else {
        section->items = NSNotFound;
    }

    return section;
}


static ADXSectionType type_for_objects(id *objects) {
    if ([*objects conformsToProtocol:@protocol(ADXObject)]) {
        *objects = @[*objects];
        return ADXSectionTypeSingularSection;
    } else if ([*objects isKindOfClass:[NSArray class]]) {
        if ([(NSArray *)*objects isNestedArray]) {
            if ([(NSArray *)*objects count] == 1) {
                *objects = [(NSArray *)*objects flatern];
                return ADXSectionTypeSingularSection;
            }
            return ADXSectionTypeMultipleSections;
        }
        return ADXSectionTypeSingularSection;
    } else {
        *objects = [NSNull null];
        return ADXSectionTypeInvalid;
    }
}

@interface ADXDatasourceBase ()

@property (strong, nonnull) NSMutableArray* sections;

@end

@implementation ADXDatasourceBase {
    ADXSectionType _type;
    id _objects;
}

- (id)objects {
    return _objects;
}

- (void)setObjects:(id)objects {
    // 1. Remove all old objects
    [self.sections removeAllObjects];

    // 2. Get the type for the datasource
    ADXSectionType type = type_for_objects(&objects);

    // 3. Set the type and Objects
    //    we do this after getting the type as
    //    the objects can be changed if they aren't
    //    100% valid.
    self->_objects = objects;
    self->_type = type;

    // 4. Add the ADXSection to the Array so we have all
    //    the required infomation for each section
    switch (self->_type) {
        case ADXSectionTypeInvalid: return;
        case ADXSectionTypeSingularSection: {
            NSValue *value = [NSValue valueWithSection:create_section_for_objects(objects, 0)];
            [self->_sections addObject:value];
            break;
        }
        case ADXSectionTypeMultipleSections: {
            [(NSArray<NSArray *>*)objects enumerateObjects:^(id obj, NSUInteger idx) {
                NSValue *value = [NSValue valueWithSection:create_section_for_objects(obj, (int)idx)];
                [self->_sections addObject:value];
            }];
            break;
        }
    }
}

+ (instancetype)new {
    ADXDatasourceBase *base = [[ADXDatasourceBase alloc] init];
    base->_sections = [NSMutableArray new];
    return base;
}

- (NSInteger)numberOfSections {
    return self.sections.count;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    NSValue *value = [self.sections objectAtIndex:section];
    ADXSection *adx_section = [value section];
    return adx_section->items;
}

- (NSArray *)objectsForSection:(NSInteger)section {
    NSValue *value = [self.sections objectAtIndex:section];
    ADXSection *adx_section = [value section];
    return adx_section->objects;
}

- (NSString *)description {
    NSMutableArray<NSString *> *strArr = @[].mutableCopy;

    for (NSValue *value in self.sections) {
        ADXSection *section = [value section];

        NSString *fmt = @"Section:%lu Items:%lu Objects:%@";
        NSString *str = [NSString stringWithFormat:fmt,
                         section->section, section->items, section->objects];
        [strArr addObject:str];
    }
    
    NSString *fmt = @"%@ {%@}";
    return [NSString stringWithFormat:fmt,
            [super description], [strArr componentsJoinedByString:@" "]];
}

@end
