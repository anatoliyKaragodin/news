import 'library.dart';

import 'dimensions_util.dart';
import 'my_colors.dart';

class MyParameters {
  static BorderRadius borderRadiusCircle =
      BorderRadius.circular(Dimensions.height10 * 1.6);
  static BorderRadius borderRadiusBigCircle =
  BorderRadius.circular(Dimensions.height10 * 20);
  static Icon backIcon = const Icon(Icons.arrow_back_ios);
  static double bigFontSize = Dimensions.height10 * 3;
  static double middleFontSize = Dimensions.height10 * 2.0;
  static double normalFontSize = Dimensions.height10 * 1.5;
  static FontWeight boldFont = FontWeight.bold;
  static TextStyle bigTextStyle = TextStyle(
      color: MyColors.blackColor54,
      fontSize: bigFontSize,
      fontWeight: boldFont);
  static TextStyle bigTextStyleWhite = TextStyle(
      color: MyColors.whiteColor,
      fontSize: bigFontSize,
      fontWeight: boldFont);
  static TextStyle middleTextStyleWhite = TextStyle(
      color: MyColors.whiteColor,
      fontSize: middleFontSize,
      fontWeight: boldFont);
  static TextStyle middleTextStyle = TextStyle(
      color: MyColors.blackColor54,
      fontSize: middleFontSize,
      fontWeight: boldFont);
  static TextStyle normalTextStyle = TextStyle(
      color: MyColors.blackColor87,
      fontSize: normalFontSize,
      );
  static TextStyle normalTextStyleWhite = TextStyle(
    color: MyColors.whiteColor,
    fontSize: normalFontSize,
  );
  static BoxDecoration backgroundImage = const BoxDecoration(
      image: DecorationImage(
    opacity: 1.0,
    image: AssetImage('assets/фон 2 (3).png'),
    fit: BoxFit.cover,
  ));
  static UnderlineInputBorder underlineBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: MyColors.whiteColor!));
  static TextStyle whiteTextStyle = TextStyle(color: MyColors.whiteColor);
  static List<BoxShadow> boxShadow = [
    BoxShadow(color: MyColors.blackColor12!, spreadRadius: 3, blurRadius: 3)
  ];
}
