import 'package:favor_cate/ui/shared/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return ADSizeFit.setPx(this);
  }

  double get rpx {
    return ADSizeFit.setRpx(this);
  }
}