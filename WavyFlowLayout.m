//
//  WavyFlowLayout.m
//  2w3d4_wavyCollectionView
//
//  Created by Seantastic31 on 16/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "WavyFlowLayout.h"

@interface WavyFlowLayout()

@property (strong, nonatomic) NSArray *savedAttributes;

@end

@implementation WavyFlowLayout

- (void)prepareLayout
{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    // Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes*> *superAttributesArray = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray<UICollectionViewLayoutAttributes*> *wavyAttributesArray = [[NSMutableArray alloc]init];
    
    for (UICollectionViewLayoutAttributes *attribute in superAttributesArray)
    {
        //need to copy attributes from superAttributesArray to avoid cached frame mismatch
        UICollectionViewLayoutAttributes *wavyAttribute = [attribute copy];
        CGFloat randomY = arc4random_uniform(self.collectionView.bounds.size.height - wavyAttribute.size.height);
        wavyAttribute.frame = CGRectMake(wavyAttribute.frame.origin.x, randomY, self.itemSize.width, self.itemSize.height);
        
        [wavyAttributesArray addObject:wavyAttribute];
    }
    
    return wavyAttributesArray;
}

@end
