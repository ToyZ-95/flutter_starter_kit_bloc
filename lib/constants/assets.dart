abstract class IAppAssetsConstants {
  factory IAppAssetsConstants.getInstance() => AppAssetsConstants();

  String get basePath;
  String get icons;
  String get iconsSvg;
  String get images;
  String get imagesSvg;

  String get noImagePlaceholder;
}

class AppAssetsConstants implements IAppAssetsConstants {
  @override
  String get basePath => "assets";

  @override
  String get icons => "$basePath/icons";

  @override
  String get iconsSvg => "$icons/svg";

  @override
  String get images => "$basePath/images";

  @override
  String get imagesSvg => "$images/svg";

  @override
  String get noImagePlaceholder => "$imagesSvg/no_image_placeholder.svg";
}
