import 'dart:ui';

class ADSizeFit {
  // 1. 基本信息
  static double physicalWidth; // 屏幕分辨率宽度
  static double physicalHeight; // 屏幕分辨率高度
  static double screenWidth; // 屏幕宽度
  static double screenHeight; // 屏幕高度
  static double dpr; // 设备像素比例
  static double statusHeight;

  static double rpx;
  static double px;

  static void initialize({double standardSize = 750}) {
    // 1. 手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    // 2. 获取dpr
    dpr = window.devicePixelRatio;

    // 3. 宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4. 状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5. 计算rpx的大小
    // rpx 根据屏幕宽度进行自适应 1rpx = 1物理像素
    rpx = screenWidth / standardSize;
    // px 像素
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}