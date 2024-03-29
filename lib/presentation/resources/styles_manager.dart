import 'package:flutter/material.dart';
import 'package:mvvm_flutter_app/presentation/resources/font_manager.dart';

class AppTextStyleManager {
  static TextStyle _getTextStyle({
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Regular Style
  static TextStyle getRegularStyle({
    double? fontSize,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize: fontSize ?? FontSize.kFontSize12,
      fontFamily: FontConstants.kFontFamily,
      color: color,
      fontWeight: FontWeightManager.kRegular,
    );
  }

  // Light Style
  static TextStyle getLightStyle({
    double? fontSize,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize: fontSize ?? FontSize.kFontSize12,
      fontFamily: FontConstants.kFontFamily,
      color: color,
      fontWeight: FontWeightManager.kLight,
    );
  }

  // Bold Style
  static TextStyle getBoldStyle({
    double? fontSize,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize: fontSize ?? FontSize.kFontSize12,
      fontFamily: FontConstants.kFontFamily,
      color: color,
      fontWeight: FontWeightManager.kBold,
    );
  }

  // Semi Bold Style
  static TextStyle getSemiBoldStyle({
    double? fontSize,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize: fontSize ?? FontSize.kFontSize12,
      fontFamily: FontConstants.kFontFamily,
      color: color,
      fontWeight: FontWeightManager.kSemiBold,
    );
  }

  // Medium Style
  static TextStyle getMediumStyle({
    double? fontSize,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize: fontSize ?? FontSize.kFontSize12,
      fontFamily: FontConstants.kFontFamily,
      color: color,
      fontWeight: FontWeightManager.kMedium,
    );
  }
}
