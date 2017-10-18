//
//  ADXViewController.m
//  Ardex
//
//  Created by harrytwright on 07/12/2017.
//  Copyright (c) 2017 harrytwright. All rights reserved.
//

#import "ADXViewController.h"

@interface Post : NSObject <ADXObject>

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;

@end

@implementation Post

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        self->_name = name;
    }
    return self;
}

- (id<NSObject>)index {
    return @(self.hash);
}

@end

@interface ADXViewController ()

@property (nonatomic, strong) ADXListView *listView;

@end

@implementation ADXViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ADXDatasource *datasource = [[ADXDatasource alloc] init];
    self.listView = [[ADXListView alloc] init];
    self.listView.datasource = datasource;

    [self.view addSubview:self.listView];
}

- (void)viewDidLayoutSubviews {
    self.listView.frame = [self.view frame];
    self.listView.backgroundColor = [UIColor lightGrayColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.listView.datasource.objects = @[@[@"Hello"], @[@"World"]];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(50 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.listView.datasource.objects = @[@[@"Hello"]];
    });
}

//- (NSArray<id<ADXObject>> *)objectsInListView:(ADXListView *)listView {
//    Post *post = [[Post alloc] initWithName:@"Alpha"];
//    return @[post];
//}

@end


