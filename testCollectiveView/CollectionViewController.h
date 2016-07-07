//
//  CollectionViewController.h
//  testCollectiveView
//
//  Created by Revo Tech on 7/6/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APLExpandableCollectionView.h"

@interface CollectionViewController : UICollectionViewController    <APLExpandableCollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, retain) APLExpandableCollectionView *collectionView;
@end
