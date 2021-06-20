import 'package:flutter/material.dart';

abstract class ThemePadding {
  static const none = 0.0;
  static const extraSmall = 2.0;
  static const small = 4.0;
  static const medium = 8.0;
  static const big = 12.0;
  static const large = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
  static const xxxl = 96.0;

  static const insetPrimary = EdgeInsets.symmetric(
    horizontal: large,
    vertical: medium,
  );

  static const insetHorizontalSmall = EdgeInsets.symmetric(horizontal: small);
  static const insetHorizontalMedium = EdgeInsets.symmetric(horizontal: medium);
  static const insetHorizontalBig = EdgeInsets.symmetric(horizontal: big);
  static const insetHorizontalLarge = EdgeInsets.symmetric(horizontal: large);
  static const insetHorizontalExtraLarge = EdgeInsets.symmetric(horizontal: xl);
  static const insetHorizontalExtraExtraLarge =
      EdgeInsets.symmetric(horizontal: xxl);
  static const insetHorizontalExtraExtraExtraLarge =
      EdgeInsets.symmetric(horizontal: xxxl);

  static const insetVerticalSmall = EdgeInsets.symmetric(vertical: small);
  static const insetVerticalMedium = EdgeInsets.symmetric(vertical: medium);
  static const insetVerticalBig = EdgeInsets.symmetric(vertical: big);
  static const insetVerticalLarge = EdgeInsets.symmetric(vertical: large);
  static const insetVerticalExtraLarge = EdgeInsets.symmetric(vertical: xl);

  static const insetAllSmall = EdgeInsets.all(small);
  static const insetAllMedium = EdgeInsets.all(medium);
  static const insetAllBig = EdgeInsets.all(big);
  static const insetAllLarge = EdgeInsets.all(large);
  static const insetAllExtraLarge = EdgeInsets.all(xl);

  static const fab = EdgeInsets.zero;
}
