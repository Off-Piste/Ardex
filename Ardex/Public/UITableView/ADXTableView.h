//
//  ADXTableView.h
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import <UIKit/UIKit.h>
#import "ADXDatasource.h"

@interface ADXTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic, nullable) ADXDatasource *adxDatasource;

@property (nonatomic) CGFloat cellHeight;

@end
