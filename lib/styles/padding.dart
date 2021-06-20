import 'package:flutter/material.dart';

abstract class ThemePadding {
  static const double none = 0.0;
  static const double extraSmall = 2.0;
  static const double small = 4.0;
  static const double medium = 8.0;
  static const double big = 12.0;
  static const double large = 16.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;
  static const double xxxl = 96.0;

  static const EdgeInsets insetPrimary = EdgeInsets.symmetric(
    horizontal: large,
    vertical: medium,
  );

  static const EdgeInsets insetHorizontalSmall =
      EdgeInsets.symmetric(horizontal: small);
  static const EdgeInsets insetHorizontalMedium =
      EdgeInsets.symmetric(horizontal: medium);
  static const EdgeInsets insetHorizontalBig =
      EdgeInsets.symmetric(horizontal: big);
  static const EdgeInsets insetHorizontalLarge =
      EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets insetHorizontalExtraLarge =
      EdgeInsets.symmetric(horizontal: xl);
  static const EdgeInsets insetHorizontalExtraExtraLarge =
      EdgeInsets.symmetric(horizontal: xxl);
  static const EdgeInsets insetHorizontalExtraExtraExtraLarge =
      EdgeInsets.symmetric(horizontal: xxxl);

  static const EdgeInsets insetVerticalSmall =
      EdgeInsets.symmetric(vertical: small);
  static const EdgeInsets insetVerticalMedium =
      EdgeInsets.symmetric(vertical: medium);
  static const EdgeInsets insetVerticalBig =
      EdgeInsets.symmetric(vertical: big);
  static const EdgeInsets insetVerticalLarge =
      EdgeInsets.symmetric(vertical: large);
  static const EdgeInsets insetVerticalExtraLarge =
      EdgeInsets.symmetric(vertical: xl);

  static const EdgeInsets insetAllSmall = EdgeInsets.all(small);
  static const EdgeInsets insetAllMedium = EdgeInsets.all(medium);
  static const EdgeInsets insetAllBig = EdgeInsets.all(big);
  static const EdgeInsets insetAllLarge = EdgeInsets.all(large);
  static const EdgeInsets insetAllExtraLarge = EdgeInsets.all(xl);

  static const EdgeInsets fab = EdgeInsets.zero;
}
