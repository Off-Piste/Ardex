//
//  TableViewController.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import <UIKit/UIKit.h>

#import "ADXMacros.h"

@class ADXDatasource;

ADX_CLASS(TableViewController, UITableViewController)

@property (strong, nullable) ADXDatasource *datasource;

- (void)refreshOptions;

@end