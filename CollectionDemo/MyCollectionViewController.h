//
//  MyCollectionViewController.h
//  CollectionDemo
//
//  Created by Ashish Agarwal on 2014-02-08.
//  Copyright (c) 2014 Ashish Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) NSMutableArray *carImages;

@end
