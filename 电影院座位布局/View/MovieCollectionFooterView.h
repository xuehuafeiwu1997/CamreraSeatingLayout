//
//  MovieCollectionFooterView.h
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieCollectionFooterView : UICollectionReusableView

@property (nonatomic,strong) UILabel *textLabel;

+ (NSString *)footerViewIdentifier;

+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
