//
//  CollectionViewController.m
//  testCollectiveView
//
//  Created by Revo Tech on 7/6/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewController ()

- (IBAction)addSection:(id)sender;

@property (strong, nonatomic) NSMutableArray *sections;

@end

@implementation CollectionViewController



@dynamic collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sections = [NSMutableArray arrayWithObjects:@"Section", @"Section1", @"Section2", nil];
    
    BOOL isiPad = [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
    CGFloat sectionInsetX = isiPad ? 14. : 8.;
    CGFloat sectionInsetTop = 8.;
    CGFloat collectionViewInsetX = isiPad ? 14. : 0.;
    CGFloat collectionViewInsetY = isiPad ? 8. : 0.;
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        collectionViewInsetY += 20.;
    }
    
    
//    UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
//    layout.itemSize = CGSizeMake(304., 44.);
//    layout.minimumLineSpacing = 4.;
//    layout.sectionInset = UIEdgeInsetsMake(sectionInsetTop, sectionInsetX, 0., sectionInsetX);
//
    
    
    self.collectionView.contentInset = UIEdgeInsetsMake(collectionViewInsetY, collectionViewInsetX, collectionViewInsetY + sectionInsetTop, collectionViewInsetX);
    self.collectionView.allowsMultipleExpandedSections = NO;
//    
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    [flowLayout setMinimumInteritemSpacing:3.0f];
//    [flowLayout setMinimumLineSpacing:3.0f];
//    [flowLayout setItemSize:CGSizeMake(50.0f, 50.0f)];
  }

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sections.count+1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    if (indexPath.item == 0) {
        cell.label.text = [NSString stringWithFormat:@"Section %li", (long)indexPath.section + 1];
        cell.backgroundColor = [UIColor colorWithRed:58./255. green:165./255. blue:192./255. alpha:1.];
        cell.indentView.hidden = YES;
        cell.button.hidden = YES;
    } else {
        cell.lbl_cell.text = [NSString stringWithFormat:@"Item %li", (long)indexPath.row];
        cell.backgroundColor = [UIColor lightGrayColor];//[UIColor colorWithRed:58./255. green:165./255. blue:192./255. alpha:.5];
        cell.img_drop_down.hidden = YES;
        cell.indentView.hidden = NO;
        cell.button.hidden = YES;
    }
    
    return cell;
}



#pragma mark - APLExpandableCollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didCollapseItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    // CGSize cellSize;
    
    
    
    // body view height
   

  
    if (indexPath.item == 0) {
        return CGSizeMake(370, 60);
      
    }
    else
    {           return CGSizeMake(180,180);
    }
   //  UICollectionViewFlowLayout* layout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
    //    if index.itme == 0 -> return CGSizeMake(400., 60.)
    //        ele return CGSizeMake(200., 60.)
//    layout.itemSize = CGSizeMake(350., 60.);
//    layout.minimumLineSpacing = 4.;
  //  layout.sectionInset = UIEdgeInsetsMake(sectionInsetTop, sectionInsetX, 0., sectionInsetX);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5.;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)colle3tionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    if (indexPath.item == 0) {
//         return UIEdgeInsetsMake(3, 3, 3, 3);
//    }
//    else
//    {
//         return UIEdgeInsetsMake(87, 3, 3, 3);
//    }
    return UIEdgeInsetsMake(3,5, 3, 5);
}

- (IBAction)addSection:(id)sender {
    CGPoint point = [sender convertPoint:CGPointZero toView:self.collectionView];
    NSIndexPath* indexPath = [self.collectionView indexPathForItemAtPoint:point];
    
    [self.sections addObject:@"Section"];
    [self.collectionView insertExpandedSection:NO atIndex:indexPath.section + 1];
    [self.collectionView reloadData];
}
@end
