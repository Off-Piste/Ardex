//
//  ADXTableView.h
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

@import UIKit;
#import "ADXDatasource.h"

/**
 <#Description#>
 */
NS_SWIFT_NAME(TableView)
@interface ADXTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

/**
 <#Description#>
 */
@property (weak, nonatomic, nullable) ADXDatasource *adxDatasource;

/**
 <#Description#>
 */
@property (nonatomic) CGFloat cellHeight;

@end
