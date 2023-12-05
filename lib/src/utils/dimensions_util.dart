import 'library.dart';

/// Dynamic size of UI elements
class Dimensions {
  /// Get screen size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  /// Height
  static double height10 = screenHeight / 79.6;

  /// Width
  static double width10 = screenWidth / 36;
}
