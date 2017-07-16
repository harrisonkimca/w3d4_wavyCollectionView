//
//  ViewController.m
//  2w3d4_wavyCollectionView
//
//  Created by Seantastic31 on 16/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"
#import "WavyCollectionViewCell.h"
#import "WavyFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

@property (nonatomic) UICollectionView *wavyCollectionView;
@property (nonatomic) WavyFlowLayout *wavyFlowLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wavyFlowLayout = [[WavyFlowLayout alloc]init];
    self.wavyCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.wavyFlowLayout];
    self.wavyCollectionView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_wavyCollectionView];
    
    // Register cell classes so can be used to reuse cells
    [self.wavyCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.wavyCollectionView.dataSource = self;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    
    return cell;
}

@end
