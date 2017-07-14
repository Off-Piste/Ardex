//
//  ADXTableViewController.h
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

@import UIKit;
#import "ADXDatasource.h"
#import "ADXTableViewCell.h"
#import <asl.h>

/**
 <#Description#>
 */
NS_SWIFT_NAME(TableViewController)
@interface ADXTableViewController : UITableViewController

/**
 <#Description#>
 */
@property (strong, nullable) ADXDatasource *datasource;

/**
 <#Description#>
 */
- (void)refreshOptions;

@end
