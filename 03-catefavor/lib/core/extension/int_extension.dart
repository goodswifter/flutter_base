import 'package:catefavor/ui/shared/size_fit.dart';

extension IntFit on int {
  double get px {
    return ADSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return ADSizeFit.setRpx(this.toDouble());
  }
}