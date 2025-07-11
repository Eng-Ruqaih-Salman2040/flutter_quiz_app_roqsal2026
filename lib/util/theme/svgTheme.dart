import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemeSvgAsset extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final bool isDarkMode;

  const ThemeSvgAsset({
    required this.assetPath,
    super.key,
    this.width,
    this.height,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final String bgColor = Theme.of(context).colorScheme.surface.toString();
   final ThemeData theme = Theme.of(context);

    return( FutureBuilder<String>(
      //future: DefaultAssetBundle.of(context).loadString('assets/homeNew.svg'),
      future: DefaultAssetBundle.of(context).loadString(assetPath),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        String svgString = snapshot.data!.replaceAll(
          '#PLACEHOLDER',
       // isDarkMode ? '#121212' : '#FFFFFF',
         // isDarkMode ? bgColor : bgColor,//'#FFFFFF' : '#121212', // Adjusted for light/dark mode
            bgColor
        );
        return SvgPicture.string(
          svgString,
          width: width,
          height: height,
        );
      },
    ));

  }
}