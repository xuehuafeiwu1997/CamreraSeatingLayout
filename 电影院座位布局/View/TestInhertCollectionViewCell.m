//
//  TestInhertCollectionViewCell.m
//  电影院座位布局
//
//  Created by 许明洋 on 2019/10/10.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "TestInhertCollectionViewCell.h"

@implementation TestInhertCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.showLabel];
        [self.showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(10);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

#pragma mark - 懒加载
- (UILabel *)showLabel {
    if (_showLabel) {
        return _showLabel;
    }
    _showLabel = [[UILabel alloc] init];
    _showLabel.text = @"你好，这是测试单元格的继承";
    _showLabel.backgroundColor = [UIColor yellowColor];
    _showLabel.font = [UIFont systemFontOfSize:11];
    return _showLabel;
}

@end
