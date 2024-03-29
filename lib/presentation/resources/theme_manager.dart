import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvvm_flutter_app/presentation/resources/colors_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/font_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/styles_manager.dart';
import 'package:mvvm_flutter_app/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,

    // ripple color
    splashColor: ColorManager.primaryOpacity70,

    // will be used incase of disabled button for example
    colorScheme: ColorScheme.fromSwatch(accentColor: ColorManager.grey),

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.kSize4,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.kSize4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: AppTextStyleManager.getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.kFontSize16,
      ),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyleManager.getRegularStyle(
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.kSize12),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: AppTextStyleManager.getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.kFontSize16,
      ),
      displayMedium: AppTextStyleManager.getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.kFontSize16,
      ),
      displaySmall: AppTextStyleManager.getBoldStyle(
        color: ColorManager.primary,
        fontSize: FontSize.kFontSize16,
      ),
      headlineMedium: AppTextStyleManager.getRegularStyle(
        color: ColorManager.primary,
        fontSize: FontSize.kFontSize14,
      ),
      titleMedium: AppTextStyleManager.getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.kFontSize14,
      ),
      titleSmall: AppTextStyleManager.getMediumStyle(
        color: ColorManager.primary,
        fontSize: FontSize.kFontSize12,
      ),
      bodyMedium: AppTextStyleManager.getMediumStyle(
        color: ColorManager.lightGrey,
      ),
      bodySmall: AppTextStyleManager.getRegularStyle(
        color: ColorManager.grey1,
      ),
      bodyLarge: AppTextStyleManager.getRegularStyle(
        color: ColorManager.grey,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(
        AppPadding.kPadding8.w,
      ),
      // hint style
      hintStyle: AppTextStyleManager.getRegularStyle(
        color: ColorManager.grey1,
      ),

      // label style
      labelStyle: AppTextStyleManager.getMediumStyle(
        color: ColorManager.darkGrey,
      ),
      // error style
      errorStyle: AppTextStyleManager.getRegularStyle(
        color: ColorManager.error,
      ),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.grey,
          width: AppSize.kSize1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppBorderRadius.kBorderRadius8,
          ),
        ),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.kSize1_5,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppBorderRadius.kBorderRadius8,
          ),
        ),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.kSize1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppBorderRadius.kBorderRadius8,
          ),
        ),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.kSize1_5),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppBorderRadius.kBorderRadius8,
          ),
        ),
      ),
    ),
  );
}
