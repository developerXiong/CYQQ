//
//  CYLeftView.m
//  CYQQ
//
//  Created by jeader on 16/5/26.
//  Copyright © 2016年 jeader. All rights reserved.
//

#import "CYLeftView.h"

#import "Header.h"

@implementation CYLeftView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.bounds.size.width, 20)];
        label.text = @"陈宫就在一念之间看你怎么选择正确的道路能让人少走几十年的错路";
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
    }
    return self;
}

@end
