//
//  MyCollectionViewController.m
//  CollectionDemo
//
//  Created by Ashish Agarwal on 2014-02-08.
//  Copyright (c) 2014 Ashish Agarwal. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "MySupplementaryView.h"

@interface MyCollectionViewController ()

@end

@implementation MyCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _carImages = [[NSMutableArray alloc] initWithObjects:@"chevy_small.jpg",
                  @"ford_small.jpg",
                  @"highlander_small.jpg",
                  @"honda_small.jpg",
                  @"jeep_small.jpg",
                  @"mini_small.jpg",
                  @"nissan_small.jpg",
                  @"rover_small.jpg",
                  @"smart_small.jpg",
                  @"venza_small.jpg",
                  @"volvo_small.jpg",
                  @"vw_small.jpg", nil] ;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_carImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCollectionViewCell *myCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell"
                                                                             forIndexPath:indexPath];
    UIImage *image = [UIImage imageNamed:[_carImages objectAtIndex:indexPath.row]];
    myCell.imageView.image = image;
    
    return myCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewFlowLayout *myLayout = [[UICollectionViewFlowLayout alloc] init];
//    myLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    [self.collectionView setCollectionViewLayout:myLayout animated:YES];
    
    [_carImages removeObjectAtIndex:indexPath.row];
    [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
    [self.collectionView reloadData];
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MySupplementaryView *header = nil;
    
    if ([kind isEqual: UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyHeader"
                                                           forIndexPath:indexPath];
        header.headerLabel.text = @"Car Image Galery";
    }
    return header;
    
}

#pragma mark UICollectionViewFlowLayoutDelegate
-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:[_carImages objectAtIndex:indexPath.row ]];
    return image.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
