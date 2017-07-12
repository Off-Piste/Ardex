//
//  ADXCollectionViewController.h
//  Ardex
//
//  Created by Harry Wright on 11.07.17.
//  Copyright © 2017 Trolley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADXDatasource.h"

/**
 <#Description#>
 */
NS_SWIFT_NAME(CollectionViewController)
@interface ADXCollectionViewController : UICollectionViewController

/**
 <#Description#>
 */
@property (strong, nullable) ADXDatasource *datasource;

/**
 <#Description#>
 */
@property (strong, readonly, nonnull) UIRefreshControl *refreshControl;

/**
 <#Description#>
 */
- (void)refreshOptions;

@end
