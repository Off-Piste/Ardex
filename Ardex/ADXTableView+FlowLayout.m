//
//  ADXTableView+FlowLayout.m
//  Pods
//
//  Created by Harry Wright on 14.07.17.
//
//

#import "ADXTableView+FlowLayout.h"

@implementation ADXTableView (FlowLayout)

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

@end
