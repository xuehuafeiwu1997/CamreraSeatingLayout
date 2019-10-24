//
//  MovieCollectionHeaderView.h
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionHeaderView : UICollectionReusableView
@property (nonatomic,strong) UILabel *textLabel;

//顶部视图的缓存池标志
+ (NSString *)headerViewIdentifier;
//获取顶部视图对象
+ (instancetype)headerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
