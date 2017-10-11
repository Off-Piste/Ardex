//
//  ADXCollectionViewController.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#import <UIKit/UIKit.h>
#import "ADXMacros.h"

@class ADXDatasource;

ADX_CLASS(CollectionViewController, UICollectionViewController)

@property (strong, nullable) ADXDatasource *datasource;

- (void)refreshOptions;

@end
