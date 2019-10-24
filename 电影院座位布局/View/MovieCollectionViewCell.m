//
//  MovieCollectionViewCell.m
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "MovieCollectionViewCell.h"

@implementation MovieCollectionViewCell

+ (NSString *)cellIdentifier {
    static NSString *cellIdentifier = @"CollectionViewCellIdentifier";
    return cellIdentifier;
}

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath {
    
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MovieCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    return cell;
}

//注册方块视图后，当缓存池中没有底部视图的对象的时候，会自动调用alloc/initWithFrame
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *textLabel = [[UILabel alloc] init];
        CGFloat x = 5;
        CGFloat y = 5;
        CGFloat width = frame.size.width - 10;
        CGFloat height = frame.size.height - 10;
        textLabel.frame = CGRectMake(x, y, width, height);
        textLabel.numberOfLines = 0;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:15];
        textLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:textLabel];
        self.textLabel = textLabel;
    }
    return self;
}
@end
