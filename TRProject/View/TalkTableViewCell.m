//
//  TalkTableViewCell.m
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TalkTableViewCell.h"

@implementation TalkTableViewCell
- (UIImageView *)iconIV {
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(8);
            make.top.equalTo(4);
            make.bottom.equalTo(-4);
            make.width.equalTo(60);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconIV.mas_right).equalTo(15);
            make.top.bottom.equalTo(self.iconIV);
            make.right.equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
