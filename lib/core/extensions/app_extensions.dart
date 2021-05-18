import 'package:flutter/material.dart';

class AppExtension {}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicHeight(double _height) => height * _height;
  double dynamicWidth(double _width) => width * _width;
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension NumberExtension on BuildContext {
  double get extraLowValue => height * 0.005; //2
  double get lowValue => height * 0.01; //4,8
  double get normalValue => height * 0.02; //12
  double get mediumValue => height * 0.03; //16
  double get mediumHighValue => height * 0.04; //24
  double get highValue => height * 0.1; //32
  double get extraHighValue => height * 0.2;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingExtraLow => EdgeInsets.all(extraLowValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingExtraLowVertical => EdgeInsets.symmetric(vertical: extraLowValue);
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingMediumHighVertical => EdgeInsets.symmetric(vertical: mediumHighValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingExtraLowHorizontal => EdgeInsets.symmetric(horizontal: extraLowValue);
  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingMediumHighHorizontal => EdgeInsets.symmetric(horizontal: mediumHighValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingExtraLowLeft => EdgeInsets.only(left: extraLowValue);
  EdgeInsets get paddingLowLeft => EdgeInsets.only(left: lowValue);
  EdgeInsets get paddingNormalLeft => EdgeInsets.only(left: normalValue);
  EdgeInsets get paddingMediumLeft => EdgeInsets.only(left: mediumValue);
  EdgeInsets get paddingHighLeft => EdgeInsets.only(left: highValue);

  EdgeInsets get paddingExtraLowRight => EdgeInsets.only(right: lowValue);
  EdgeInsets get paddingLowRight => EdgeInsets.only(right: extraLowValue);
  EdgeInsets get paddingNormalRight => EdgeInsets.only(right: normalValue);
  EdgeInsets get paddingMediumRight => EdgeInsets.only(right: mediumValue);
  EdgeInsets get paddingHighRight => EdgeInsets.only(right: highValue);

  EdgeInsets get paddingExtraLowTop => EdgeInsets.only(top: extraLowValue);
  EdgeInsets get paddingLowTop => EdgeInsets.only(top: lowValue);
  EdgeInsets get paddingNormalTop => EdgeInsets.only(top: normalValue);
  EdgeInsets get paddingMediumTop => EdgeInsets.only(top: mediumValue);
  EdgeInsets get paddingMediumHighTop => EdgeInsets.only(top: mediumHighValue);
  EdgeInsets get paddingHighTop => EdgeInsets.only(top: highValue);

  EdgeInsets get paddingExtraLowBottom => EdgeInsets.only(bottom: extraLowValue);
  EdgeInsets get paddingLowBottom => EdgeInsets.only(bottom: lowValue);
  EdgeInsets get paddingNormalBottom => EdgeInsets.only(bottom: normalValue);
  EdgeInsets get paddingMediumBottom => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get paddingHighBottom => EdgeInsets.only(bottom: highValue);
}
