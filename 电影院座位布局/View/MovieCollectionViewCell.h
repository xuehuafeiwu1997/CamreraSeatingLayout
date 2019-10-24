//
//  MovieCollectionViewCell.h
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *textLabel;

//方块视图的缓存池标志
+ (NSString *)cellIdentifier;

//获取方块视图的对象
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
