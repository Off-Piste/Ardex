//
//  ADXTableViewController.m
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import "ADXTableViewController.h"

@interface ADXTableViewController ()

@end

@implementation ADXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    (self.tableView).alwaysBounceVertical = YES;
}

- (UIRefreshControl *)refreshControl {
    UIRefreshControl *aRefreshControl = [[UIRefreshControl alloc] init];
    aRefreshControl.tintColor = [UIColor lightGrayColor];
    [aRefreshControl addTarget:self
                        action:@selector(refreshOptions)
              forControlEvents:UIControlEventValueChanged];
    
    return aRefreshControl;
}

- (void)refreshOptions { }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.datasource).numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datasource numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADXTableViewCell *cell;
    if ([(self.datasource) tableViewCellClassForIndexPath:indexPath]) {
        ADXTableViewCell *class = [(self.datasource) tableViewCellClassForIndexPath:indexPath];
        NSString *reuseID = [[class class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else if ((self.datasource).tableCellClasses.firstObject) {
        ADXTableViewCell *classes = (self.datasource).tableCellClasses.firstObject;
        NSString *reuseID = [[classes class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else if ((self.datasource).tableCellClasses.count > indexPath.section) {
        ADXTableViewCell *classes = (self.datasource).tableCellClasses[indexPath.section];
        NSString *reuseID = [[classes class] reuseID];
        cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
    } else {
        asl_log_message(ASL_LEVEL_NOTICE, "[Ardex] Invlid cell classes inside datasource, outputting `UITableViewCell` instead.");
        UITableViewCell *cell = [UITableViewCell new];
        return cell;
    }
    
    cell.datasourceItem = [self.datasource itemAtIndexPath:indexPath];
    return cell;
}

@end
