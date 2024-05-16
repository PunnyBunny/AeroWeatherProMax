import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4281426573),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291814911),
      onPrimaryContainer: Color(4278197556),
      secondary: Color(4283588720),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292207863),
      onSecondaryContainer: Color(4279115050),
      tertiary: Color(4285093753),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293975039),
      onTertiaryContainer: Color(4280489266),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292797419),
      onSurfaceVariant: Color(4282533710),
      outline: Color(4285691775),
      outlineVariant: Color(4290955215),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293915126),
      inversePrimary: Color(4288531451),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278197556),
      primaryFixedDim: Color(4288531451),
      onPrimaryFixedVariant: Color(4279388787),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4279115050),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4282009687),
      tertiaryFixed: Color(4293975039),
      onTertiaryFixed: Color(4280489266),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4283449440),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278863471),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283005092),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281746515),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285036166),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283186268),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286606737),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      surfaceVariant: Color(4292797419),
      onSurfaceVariant: Color(4282270538),
      outline: Color(4284112742),
      outlineVariant: Color(4285954946),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4293915126),
      inversePrimary: Color(4288531451),
      primaryFixed: Color(4283005092),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281229194),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285036166),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283391341),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286606737),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284896631),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278199358),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278863471),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279575345),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281746515),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280949818),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283186268),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294441471),
      onBackground: Color(4279770144),
      surface: Color(4294441471),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292797419),
      onSurfaceVariant: Color(4280230954),
      outline: Color(4282270538),
      outlineVariant: Color(4282270538),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4292931071),
      primaryFixed: Color(4278863471),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202191),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281746515),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280299068),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283186268),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281673285),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 120, 140, 164),
      surfaceTint: Color(4288531451),
      onPrimary: Color(4278203221),
      primaryContainer: Color(4279388787),
      onPrimaryContainer: Color(4291814911),
      secondary: Color.fromARGB(255, 100, 98, 143),
      onSecondary: Color(4280562240),
      secondaryContainer: Color(4282009687),
      onSecondaryContainer: Color(4292207863),
      tertiary: Color(0xff222222),
      onTertiary: Color(4281936457),
      tertiaryContainer: Color(4283449440),
      onTertiaryContainer: Color(4293975039),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color.fromARGB(255, 45, 45, 45),
      onBackground: Color(4292928232),
      surface: Color(4279243800),
      onSurface: Color(4292928232),
      surfaceVariant: Color(4282533710),
      onSurfaceVariant: Color(4290955215),
      outline: Color(4287402393),
      outlineVariant: Color(4282533710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inverseOnSurface: Color(4281151797),
      inversePrimary: Color(4281426573),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278197556),
      primaryFixedDim: Color(4288531451),
      onPrimaryFixedVariant: Color(4279388787),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4279115050),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4282009687),
      tertiaryFixed: Color(4293975039),
      onTertiaryFixed: Color(4280489266),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4283449440),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280098852),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4288860159),
      surfaceTint: Color(4288531451),
      onPrimary: Color(4278196267),
      primaryContainer: Color(4284978626),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290694367),
      onSecondary: Color(4278785829),
      secondaryContainer: Color(4286878371),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292396010),
      onTertiary: Color(4280160045),
      tertiaryContainer: Color(4288514478),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279243800),
      onBackground: Color(4292928232),
      surface: Color(4279243800),
      onSurface: Color(4294638335),
      surfaceVariant: Color(4282533710),
      onSurfaceVariant: Color(4291218387),
      outline: Color(4288586667),
      outlineVariant: Color(4286546827),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inverseOnSurface: Color(4280756783),
      inversePrimary: Color(4279520117),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278194723),
      primaryFixedDim: Color(4288531451),
      onPrimaryFixedVariant: Color(4278204766),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4278456863),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4280956742),
      tertiaryFixed: Color(4293975039),
      onTertiaryFixed: Color(4279831079),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4282330959),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280098852),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4294638335),
      surfaceTint: Color(4288531451),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288860159),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290694367),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965756),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292396010),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279243800),
      onBackground: Color(4292928232),
      surface: Color(4279243800),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282533710),
      onSurfaceVariant: Color(4294638335),
      outline: Color(4291218387),
      outlineVariant: Color(4291218387),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278201418),
      primaryFixed: Color(4292340223),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288860159),
      onPrimaryFixedVariant: Color(4278196267),
      secondaryFixed: Color(4292536571),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290694367),
      onSecondaryFixedVariant: Color(4278785829),
      tertiaryFixed: Color(4294172927),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292396010),
      onTertiaryFixedVariant: Color(4280160045),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280098852),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
