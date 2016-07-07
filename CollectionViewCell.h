//
//  CollectionViewCell.h
//  testCollectiveView
//
//  Created by Revo Tech on 7/6/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *indentView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *lbl_cell;
@property (weak, nonatomic) IBOutlet UIImageView *img_drop_down;


@end
