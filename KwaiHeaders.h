// by Mieing 25.3.3

#import <UIKit/UIKit.h>

@interface KSTabBarNewSlideFeedToolItemView : UIView
@end

@interface KSGPendantTaskAdsorptionBaoView : UIView
@end

@interface KSGPendantBgView: UIView
@end

@interface KSLocalPagePendantView: UIView
@end

@interface KSLocalPagePendantAdsorpView
- (id)closeButton;
- (void)didClickCloseButton;
@end

@interface KSAdSplashViewController : UIViewController
- (id)view;
- (void)dismissViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
@end

@interface KSLocalHeaderCollectionView : UICollectionView

@property (nonatomic, strong) UIView *view;
- (void)reloadData;
@end

@interface KSLocalHeaderCollectionCell : UICollectionViewCell
- (void)layoutSubviews;
@end

@interface KSDanmakuCellContentView : UIView
- (UIColor *)generateRandomColor;
@property (nonatomic, strong) UILabel *contentLabel;
@end

@interface KSCubeHomeTopBarItemButton : UIButton
@end
