//
//  ArdexTests.m
//  ArdexTests
//
//  Created by harrytwright on 07/12/2017.
//  Copyright (c) 2017 harrytwright. All rights reserved.
//

@import Ardex;

@interface ADXDatasource_Test : QuickSpec

@end

@implementation ADXDatasource_Test

- (void)spec {
    describe(@"ADXDatasource", ^{
        context(@"Adding objects", ^{
            it(@"Will pass", ^{
                // Given
                ADXDatasource *ds = [[ADXDatasource alloc] init];
                ADXListView *listView = [[ADXListView alloc] init];

                // Then, When
                listView.datasource = ds;
                expect(listView.datasource.objects).to(beEmpty());

                // Then, When
                listView.datasource.objects = @[@"Hello", @"World"];
                expect(listView.datasource.objects).toNot(beEmpty());
            });
        });
    });
}

//- (void)spec {
//    describe(@"ADXDatasource", ^{
//        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
//        
//        context(@"When newly setup", ^{
//            it(@"Will throw error", ^{
//                expectAction(^{ [[ADXDatasource alloc] init]; }).to(raiseException());
//            });
//            
//            it(@"Will have empty objects", ^{
//                ADXDatasource *datasource = [[ADXDatasource alloc] initWithTableView:tableView];
//                expect(datasource.objects).to(beEmpty());
//            });
//            
//            it(@"Will have Objects", ^{
//                ADXDatasource *datasource = [[ADXDatasource alloc] initWithTableView:tableView
//                                                                             objects:@[@"Hello", @"World"]];
//                expect(datasource.objects.count).to(equal(2));
//            });
//        });
//        
//        context(@"When used by TableView", ^{
//            it(@"Will pass", ^{
//                ADXDatasource *datasource = [[ADXDatasource alloc] initWithTableView:tableView];
//                [datasource setObjects:@[@"Hello", @"World"]];
//                
//                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//                expect([datasource numberOfSections]).to(equal(1));
//                expect([datasource numberOfItemsInSection:0]).to(equal(2));
//                expect([datasource itemAtIndexPath:indexPath]).to(equal(@"Hello"));
//            });
//        });
//    });
//}

@end
