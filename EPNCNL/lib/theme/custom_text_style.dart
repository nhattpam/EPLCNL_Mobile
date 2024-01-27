import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineSmall25 => theme.textTheme.headlineSmall!.copyWith(
        fontSize: 25.fSize,
      );

  static get headlineSmallHelenaJohnsmithGray80001 =>
      theme.textTheme.headlineSmall!.helenaJohnsmith.copyWith(
        color: appTheme.gray80001,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );

  static get headlineSmallJuaBlack900 =>
      theme.textTheme.headlineSmall!.jua.copyWith(
        color: appTheme.black900,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );

  static get headlineSmallJuaGray70001 =>
      theme.textTheme.headlineSmall!.jua.copyWith(
        color: appTheme.gray70001,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );

  static get headlineSmallJuaOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.jua.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 25.fSize,
        fontWeight: FontWeight.w400,
      );

  static get headlineSmallMishella =>
      theme.textTheme.headlineSmall!.mishella.copyWith(
        fontWeight: FontWeight.w400,
      );

  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );

  static get labelLargeBluegray200 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeBluegray20012 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray200,
        fontSize: 12.fSize,
      );

  static get labelLargeBluegray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeBluegray900_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray900,
      );

  static get labelLargeExtraBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );

  static get labelLargeGray50001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray50001,
      );

  static get labelLargeGray700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray700.withOpacity(0.8),
      );

  static get labelLargeGray800 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeGray80001 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray80001,
        fontSize: 12.fSize,
      );

  static get labelLargeJostBluegray900 =>
      theme.textTheme.labelLarge!.jost.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );

  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 12.fSize,
      );

  static get labelLargeOnPrimaryContainerExtraBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeOnPrimaryContainer_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static get labelLargeOrangeA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.orangeA700,
        fontSize: 12.fSize,
      );

  static get labelLargePoppinsBluegray20001 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.blueGray20001,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );

  static get labelLargePoppinsGray90002 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray90002,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );

  static get labelLargePoppinsGray90003 =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: appTheme.gray90003,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );

  static get labelLargePoppinsOnPrimaryContainer =>
      theme.textTheme.labelLarge!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );

  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w800,
      );

  static get labelLargeTeal700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.teal700,
        fontSize: 12.fSize,
        fontWeight: FontWeight.w800,
      );

  static get labelMediumGray700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray700,
      );

  static get labelMediumOnPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static get labelSmallTeal700 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.teal700,
      );

  // Title text style
  static get titleLarge20 => theme.textTheme.titleLarge!.copyWith(
        fontSize: 20.fSize,
      );

  static get titleLargeJuaBlack900 => theme.textTheme.titleLarge!.jua.copyWith(
        color: appTheme.black900,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeJuaOnPrimaryContainer =>
      theme.textTheme.titleLarge!.jua.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeJuaPrimary => theme.textTheme.titleLarge!.jua.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
      );

  static get titleLargeMulishGray80001 =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: appTheme.gray80001,
        fontWeight: FontWeight.w800,
      );

  static get titleLargeMulishIndigo700 =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: appTheme.indigo700,
        fontSize: 20.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleLargeMulishOnPrimaryContainer =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleLargeMulishPrimary =>
      theme.textTheme.titleLarge!.mulish.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w800,
      );

  static get titleLargeOnPrimaryContainer =>
      theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static get titleMedium17 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 17.fSize,
      );

  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );

  static get titleMedium19 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 19.fSize,
      );

  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
      );

  static get titleMediumMulish => theme.textTheme.titleMedium!.mulish.copyWith(
        fontWeight: FontWeight.w800,
      );

  static get titleMediumMulishBluegray200 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w700,
      );

  static get titleMediumMulishGray80001 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: appTheme.gray80001,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleMediumMulishPrimary =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleMediumMulishffff9300 =>
      theme.textTheme.titleMedium!.mulish.copyWith(
        color: Color(0XFFFF9300),
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleMediumOnPrimaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 18.fSize,
      );

  static get titleMediumPoppinsGray90002 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray90002,
      );

  static get titleMediumPoppinsGray90002Medium =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray90002,
        fontWeight: FontWeight.w500,
      );

  static get titleMediumPoppinsGray90003 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray90003,
      );

  static get titleMediumPoppinsOnPrimaryContainer =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );

  static get titleMediumTeal700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.teal700,
      );

  static get titleSmall15 => theme.textTheme.titleSmall!.copyWith(
        fontSize: 15.fSize,
      );

  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );

  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900.withOpacity(0.8),
      );

  static get titleSmallBluegray90015 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
      );

  static get titleSmallBluegray900ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );

  static get titleSmallBluegray900ExtraBold15 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleSmallBluegray900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900.withOpacity(0.8),
      );

  static get titleSmallBluegray900_2 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
      );

  static get titleSmallGray50001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50001,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallGray5000115 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray50001,
        fontSize: 15.fSize,
      );

  static get titleSmallGray800 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray800,
        fontSize: 15.fSize,
      );

  static get titleSmallGray80001 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray80001,
      );

  static get titleSmallJostBluegray900 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.blueGray900,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallJostBluegray900SemiBold =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallJostOnPrimaryContainer =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallJostOnPrimaryContainerSemiBold =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallJostff202244 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: Color(0XFF202244),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallJostffff9300 =>
      theme.textTheme.titleSmall!.jost.copyWith(
        color: Color(0XFFFF9300),
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );

  static get titleSmallOnPrimaryContainer =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleSmallPoppinsBluegray20001 =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: appTheme.blueGray20001,
        fontWeight: FontWeight.w500,
      );

  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w800,
      );

  static get titleSmallPrimary15 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 15.fSize,
      );

  static get titleSmallff545454 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF545454),
        fontWeight: FontWeight.w800,
      );

  static get titleSmallff545454_1 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF545454),
      );

  static get titleSmallffff9300 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFFF9300),
        fontWeight: FontWeight.w800,
      );

  static get titleSmallffff9300ExtraBold =>
      theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFFF9300),
        fontWeight: FontWeight.w800,
      );

  static get titleSmallffffffff => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFFFFFFFF),
        fontWeight: FontWeight.w800,
      );
}

extension on TextStyle {
  TextStyle get helenaJohnsmith {
    return copyWith(
      fontFamily: 'Helena Johnsmith',
    );
  }

  TextStyle get jost {
    return copyWith(
      fontFamily: 'Jost',
    );
  }

  TextStyle get jua {
    return copyWith(
      fontFamily: 'Jua',
    );
  }

  TextStyle get mulish {
    return copyWith(
      fontFamily: 'Mulish',
    );
  }

  TextStyle get mishella {
    return copyWith(
      fontFamily: 'Mishella',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
