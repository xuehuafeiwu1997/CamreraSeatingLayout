//
//  MovieCollectionFooterView.m
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "MovieCollectionFooterView.h"

@implementation MovieCollectionFooterView

//底部视图的缓存池标示
+ (NSString *)footerViewIdentifier{
    static NSString *footerIdentifier = @"footerViewIdentifier";
    return footerIdentifier;
}
//获取底部视图对象
+ (instancetype)footerViewWithCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath{
    //从缓存池中寻找底部视图对象，如果没有，该方法自动调用alloc/initWithFrame创建一个新的底部视图返回
    MovieCollectionFooterView *footerView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[MovieCollectionFooterView footerViewIdentifier] forIndexPath:indexPath];
    return footerView;
    
}
//注册了底部视图后，当缓存池中没有底部视图的对象时候，自动调用alloc/initWithFrame创建
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *textLabel=[[UILabel alloc]init];
        CGFloat x=5;
        CGFloat y=5;
        CGFloat width=frame.size.width-10;
        CGFloat height=frame.size.height-10;
        textLabel.frame=CGRectMake(x, y, width, height);
        textLabel.numberOfLines=0;
        textLabel.textAlignment=NSTextAlignmentCenter;
        textLabel.font=[UIFont systemFontOfSize:15];
        textLabel.textColor=[UIColor whiteColor];
        [self addSubview:textLabel];
        self.textLabel = textLabel;
    }
    return self;
}

@end
