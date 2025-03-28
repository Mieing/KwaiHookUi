// by Mieing 25.3.3

#import <UIKit/UIKit.h>
#import <KwaiHeaders.h>

// 移除音乐转盘
%hook KSTabbarMusicDiskRootView 

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end

// 移除收藏、分享按钮
%hook KSTabBarNewSlideFeedToolItemView

- (void)layoutSubviews {
    %orig;

    NSString *accessibilityLabel = self.accessibilityLabel;

    if ([accessibilityLabel containsString:@"未收藏，收藏"]) {
        ((UIView *)self).hidden = YES;
    }

    if ([accessibilityLabel containsString:@"分享"]) {
        ((UIView *)self).hidden = YES;

    }
}

%end

// 移除红包
%hook KSGPendantTaskAdsorptionBaoView

- (void)layoutSubviews {
    %orig; 
    ((UIView *)self).hidden = YES; 
}

%end

// 移除红包
%hook KSGPendantBgView

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end

// 移除同城悬浮
%hook KSLocalPagePendantView

- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES; 
}

%end

// Ad
%hook KSLocalPagePendantAdsorpView


- (void)layoutSubviews {
    %orig;
    ((UIView *)self).hidden = YES;

}

- (void)configAdsorpViewWithItem:(id)item {

}


- (void)didClickCloseButton {
}

- (void)removeCloseButton {
    id closeButton = [self closeButton];
    if (closeButton) {
        [(UIView *)closeButton setHidden:YES];
    }
}

%end

// 隐藏底栏皮肤
%hook KSCubeRFBottomBarView
- (void)setFromBgImageView:(id)arg1 {
}
%end

// 随机颜色弹幕
%hook KSDanmakuCellContentView
- (void)layoutSubviews {
    %orig;
    if (self.contentLabel && !self.contentLabel.hidden) {
        UIColor *randomColor = [self generateRandomColor];
        self.contentLabel.textColor = randomColor;
    }
}

%new
- (UIColor *)generateRandomColor {
    u_int32_t red = arc4random_uniform(256);
    u_int32_t green = arc4random_uniform(256);
    u_int32_t blue = arc4random_uniform(256);
    return [UIColor colorWithRed:red/255.0f
                         green:green/255.0f
                          blue:blue/255.0f
                         alpha:1.0];
}
%end

// 移除商城、热门按钮
%hook KSCubeHomeTopBarItemButton

- (void)layoutSubviews {
    %orig;
    
    if (self.currentTitle && 
       ([self.currentTitle isEqualToString:@"商城"] || 
        [self.currentTitle isEqualToString:@"热门"])) {
        [self removeFromSuperview];
    }
}

%end

// 移除我页面的“上周数据更新”
%hook KSProfileWeeklyReportButton
- (void)setupSubviews {
}
%end

// 始终显示视频发布时间
%hook KSSlidePublishTimeProvider
- (bool)canShowElement {
	return 1;
}
%end

// 隐藏长图点击查看按钮
%hook KSTabBarFeedAtlasSimpleEntranceView

- (void)setCenter:(CGPoint)center {
    center.x += 500;
    self.hidden = YES;
    %orig(center);
}

- (void)setHidden:(BOOL)hidden {
    %orig(hidden);
}

%end

// 移除同城页面顶栏横幅
%hook KSLocalHeaderCollectionView

- (CGRect)frame {
    CGRect orig = %orig;
    [self removeFromSuperview];
    return CGRectMake(orig.origin.x, orig.origin.y, 0, 0);
}

%end
