//
//  ADXViewable.h
//  Ardex
//
//  Created by Harry Wright on 10.10.17.
//

#ifndef ADXViewable_h
#define ADXViewable_h

@import Foundation;

#import "ADXMacros.h"

/**
 ADXViewable is the protocol that both UICollectionView and UITableView conform
 to so we can have ADXDatasource generic and one to do both, but fair enough so
 it will throw a NSException for when you try to access a UITableViewCell for a
 collectionView or ViceVersa.
 */
ADX_SWIFT_NAME(Viewable)
@protocol ADXViewable <NSObject>

/**
 Method used to call -[reloadData:] from inside the UICollectionView and UITableView.
 */
- (void)reload;

@end

#endif /* ADXViewable_h */
