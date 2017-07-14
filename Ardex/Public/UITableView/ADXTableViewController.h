//
//  ADXTableViewController.h
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import <UIKit/UIKit.h>
#import "ADXDatasource.h"
#import "ADXTableViewCell.h"
#import <asl.h>

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
