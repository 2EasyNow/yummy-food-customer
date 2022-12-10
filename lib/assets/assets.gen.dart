/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Bookmark-filled.svg
  SvgGenImage get bookmarkFilled =>
      const SvgGenImage('assets/icons/Bookmark-filled.svg');

  /// File path: assets/icons/Bookmark-outline.svg
  SvgGenImage get bookmarkOutline =>
      const SvgGenImage('assets/icons/Bookmark-outline.svg');

  /// File path: assets/icons/Call.svg
  SvgGenImage get call => const SvgGenImage('assets/icons/Call.svg');

  /// File path: assets/icons/Chat-filled.svg
  SvgGenImage get chatFilled =>
      const SvgGenImage('assets/icons/Chat-filled.svg');

  /// File path: assets/icons/Chat-outline.svg
  SvgGenImage get chatOutline =>
      const SvgGenImage('assets/icons/Chat-outline.svg');

  /// File path: assets/icons/Home-filled.svg
  SvgGenImage get homeFilled =>
      const SvgGenImage('assets/icons/Home-filled.svg');

  /// File path: assets/icons/Home-outline.svg
  SvgGenImage get homeOutline =>
      const SvgGenImage('assets/icons/Home-outline.svg');

  /// File path: assets/icons/Info Square.svg
  SvgGenImage get infoSquare =>
      const SvgGenImage('assets/icons/Info Square.svg');

  /// File path: assets/icons/Logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/icons/Logout.svg');

  /// File path: assets/icons/Message.svg
  SvgGenImage get message => const SvgGenImage('assets/icons/Message.svg');

  /// File path: assets/icons/Notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/Notification.svg');

  /// File path: assets/icons/Profile-filled.svg
  SvgGenImage get profileFilled =>
      const SvgGenImage('assets/icons/Profile-filled.svg');

  /// File path: assets/icons/Profile-outline.svg
  SvgGenImage get profileOutline =>
      const SvgGenImage('assets/icons/Profile-outline.svg');

  /// File path: assets/icons/Profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/Profile.svg');

  /// File path: assets/icons/Show.svg
  SvgGenImage get show => const SvgGenImage('assets/icons/Show.svg');

  /// File path: assets/icons/address.svg
  SvgGenImage get address => const SvgGenImage('assets/icons/address.svg');

  /// File path: assets/icons/people_group_filled.svg
  SvgGenImage get peopleGroupFilled =>
      const SvgGenImage('assets/icons/people_group_filled.svg');

  /// File path: assets/icons/people_group_outlined.svg
  SvgGenImage get peopleGroupOutlined =>
      const SvgGenImage('assets/icons/people_group_outlined.svg');

  /// File path: assets/icons/project-filled.svg
  SvgGenImage get projectFilled =>
      const SvgGenImage('assets/icons/project-filled.svg');

  /// File path: assets/icons/project-outlined.svg
  SvgGenImage get projectOutlined =>
      const SvgGenImage('assets/icons/project-outlined.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/google_icon.png
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/images/google_icon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/no-members-found.png
  AssetGenImage get noMembersFound =>
      const AssetGenImage('assets/images/no-members-found.png');

  /// File path: assets/images/notFound.png
  AssetGenImage get notFound =>
      const AssetGenImage('assets/images/notFound.png');

  /// File path: assets/images/pizza.jpg
  AssetGenImage get pizza => const AssetGenImage('assets/images/pizza.jpg');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/burger.svg
  SvgGenImage get burger => const SvgGenImage('assets/svg/burger.svg');

  /// File path: assets/svg/delivery_boy.svg
  SvgGenImage get deliveryBoy =>
      const SvgGenImage('assets/svg/delivery_boy.svg');

  /// File path: assets/svg/food_wishes.svg
  SvgGenImage get foodWishes => const SvgGenImage('assets/svg/food_wishes.svg');

  /// File path: assets/svg/success.svg
  SvgGenImage get success => const SvgGenImage('assets/svg/success.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
