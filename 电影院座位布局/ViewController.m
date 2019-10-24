//
//  ViewController.m
//  电影院座位布局
//
//  Created by 许明洋 on 2019/9/5.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"
#import "MovieCollectionViewCell.h"
#import "MovieCollectionHeaderView.h"
#import "MovieCollectionFooterView.h"
#import "TestInhertCollectionViewCell.h"

#define contentViewBgColor [UIColor colorWithRed:44.0f/255.0f green:106.0f/255.0f blue:152.0f/255.0 alpha:1]
#define viewBgColor [UIColor colorWithRed:235.0f/255.0f green:235.0f/255.0f blue:233.0f/255.0 alpha:1]

//屏幕的宽和高
#define SCREEN_WIDTH  ([UIScrren mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

//容器视图
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark - 懒加载容器视图
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat width = self.view.frame.size.width;
        CGFloat height = self.view.frame.size.height - (self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height);
        //创建布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //设置滚动方向为垂直滚动，说明方块是从左上到右下的布局方式
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置顶部视图和底部视图的大小，当滚动方向为竖直时，设置宽度无效，当滚动方向为水平时，设置高度无效
        layout.headerReferenceSize = CGSizeMake(100, 40);
        layout.footerReferenceSize = CGSizeMake(100, 40);
        
        //创建容器视图
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(x, y, width, height) collectionViewLayout:layout];
        //设置代理
        self.collectionView.delegate = self;
        //设置数据源
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UICollectionVeiw";
    
    //解决偏移问题
    self.navigationController.navigationBar.translucent = NO;
    
    [self.view addSubview:self.collectionView];
    
    //注册继承显示的测试视图
    [self.collectionView registerClass:[TestInhertCollectionViewCell class] forCellWithReuseIdentifier:[TestInhertCollectionViewCell cellIdentifier]];
    
//    //注册容器中显示的方块视图
//    [self.collectionView registerClass:[MovieCollectionViewCell class] forCellWithReuseIdentifier:[MovieCollectionViewCell cellIdentifier]];
    
    //注册容器中显示的顶部视图
    [self.collectionView registerClass:[MovieCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[MovieCollectionHeaderView headerViewIdentifier]];
    
    //注册容器视图中显示的底部视图
    [self.collectionView registerClass:[MovieCollectionFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:[MovieCollectionFooterView footerViewIdentifier]];
    
    
}
#pragma mark - UICollectionViewDataSource
//设置容器中有多少个组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}
//设置每组有多少个方块
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
//设置方块的视图
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //使用继承的UICollectionViewCell去创建cell
    TestInhertCollectionViewCell *cell = [TestInhertCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
//    //获取cell视图，内部通过缓存池去取，如果缓存池中没有，就自动创建一个新的cell
//    MovieCollectionViewCell *cell = [MovieCollectionViewCell cellWithCollectionView:collectionView forIndexPath:indexPath];
    cell.contentView.backgroundColor = contentViewBgColor;
    cell.textLabel.text = [NSString stringWithFormat:@"cell %2ld",indexPath.row];
    return cell;
}
//设置底部和顶部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //获取顶部视图
        MovieCollectionHeaderView *headerView=[MovieCollectionHeaderView headerViewWithCollectionView:collectionView forIndexPath:indexPath];
        
        //设置顶部视图对象属性
        headerView.backgroundColor = viewBgColor;
        headerView.textLabel.text = [NSString stringWithFormat:@" -HEADER-%ld-",indexPath.section];
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        //获取底部视图
        MovieCollectionFooterView *footerView = [MovieCollectionFooterView footerViewWithCollectionView:collectionView forIndexPath:indexPath];
        
        //设置底部视图属性
        footerView.backgroundColor = contentViewBgColor;
        footerView.textLabel.text = [NSString stringWithFormat:@"-FOOTER-%ld-",indexPath.section];
        return footerView;
    }
    return nil;
}

#pragma mark - UICollectionViewDelegateFlowLayout
//设置各个方块的大小尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = 50;
    CGFloat height = 50;
    return CGSizeMake(width,height);
}
//设置每一组的上下左右间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
#pragma mark - UICollectionViewDelegate
//方块被选中调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击选择了第%ld组，第%ld个方块",indexPath.section,indexPath.row);
}
//方块取消选中时调用
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选择第%ld组，第%ld个方块",indexPath.section,indexPath.row);
}
@end
