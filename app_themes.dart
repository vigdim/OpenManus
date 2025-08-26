import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Modern, professional, and strict theme with enhanced depth and sophisticated design.
class AppThemes {
  // Professional brand colors with better contrast and sophistication
  static const Color _lightSeed = Color(0xFF1565C0); // Deep blue - professional
  static const Color _darkSeed = Color(0xFF3949AB);  // Indigo - sophisticated

  // Enhanced border radius system for modern look
  static const BorderRadius _radiusXS = BorderRadius.all(Radius.circular(6));
  static const BorderRadius _radiusS = BorderRadius.all(Radius.circular(8));
  static const BorderRadius _radiusM = BorderRadius.all(Radius.circular(12));
  static const BorderRadius _radiusL = BorderRadius.all(Radius.circular(16));
  static const BorderRadius _radiusXL = BorderRadius.all(Radius.circular(24));

  // Enhanced elevation system for better depth perception
  static const double _cardElevationLight = 4;
  static const double _cardElevationDark = 2;
  static const double _appBarElevationLight = 1;
  static const double _buttonElevationLight = 2;
  static const double _buttonElevationDark = 1;
  static const double _dialogElevation = 8;

  // Spacing system
  static const EdgeInsets _paddingS = EdgeInsets.all(8);
  static const EdgeInsets _paddingM = EdgeInsets.all(12);
  static const EdgeInsets _paddingL = EdgeInsets.all(16);
  static const EdgeInsets _paddingXL = EdgeInsets.all(20);

  static TextTheme _buildTextTheme(TextTheme base, Color onSurface, {bool isDark = false}) {
    // More refined typography with better hierarchy
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w300,
        letterSpacing: -0.25,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.25,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        height: 1.43,
        letterSpacing: 0.25,
      ),
      bodySmall: base.bodySmall?.copyWith(
        color: onSurface.withOpacity(isDark ? 0.7 : 0.6),
        height: 1.33,
        letterSpacing: 0.4,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }

  static ButtonStyle _primaryButtonStyle(ColorScheme cs, {bool isDark = false}) {
    return FilledButton.styleFrom(
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
      shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      elevation: isDark ? _buttonElevationDark : _buttonElevationLight,
      shadowColor: cs.primary.withOpacity(isDark ? 0.2 : 0.3),
    ).copyWith(
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.hovered)) {
          return cs.onPrimary.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return cs.onPrimary.withOpacity(0.12);
        }
        return null;
      }),
    );
  }

  static ButtonStyle _secondaryButtonStyle(ColorScheme cs, {bool isDark = false}) {
    return FilledButton.styleFrom(
      backgroundColor: cs.secondaryContainer,
      foregroundColor: cs.onSecondaryContainer,
      shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      elevation: isDark ? 0 : 1,
      shadowColor: cs.secondary.withOpacity(0.2),
    );
  }

  static ThemeData get lightTheme {
    final ColorScheme cs = ColorScheme.fromSeed(
      seedColor: _lightSeed,
      brightness: Brightness.light,
    );

    // Enhanced color scheme with better contrast
    final enhancedCs = cs.copyWith(
      surface: const Color(0xFFFAFBFC), // Slightly warmer white
      onSurface: const Color(0xFF1A1C1E), // Deeper black for better contrast
      surfaceVariant: const Color(0xFFF1F3F5), // Subtle variant
      outline: const Color(0xFFDADCE0), // Softer outline
      outlineVariant: const Color(0xFFE8EAED), // Even softer variant
    );

    final base = ThemeData(
      colorScheme: enhancedCs,
      scaffoldBackgroundColor: enhancedCs.surface,
      textTheme: _buildTextTheme(ThemeData.light().textTheme, enhancedCs.onSurface),
      primaryColor: enhancedCs.primary,
      splashColor: enhancedCs.primary.withOpacity(0.08),
      highlightColor: enhancedCs.primary.withOpacity(0.04),
      useMaterial3: true,
    );

    return base.copyWith(
      // Enhanced AppBar with subtle shadow
      appBarTheme: AppBarTheme(
        backgroundColor: enhancedCs.surface,
        foregroundColor: enhancedCs.onSurface,
        centerTitle: false, // More modern left-aligned
        elevation: _appBarElevationLight,
        shadowColor: Colors.black.withOpacity(0.05),
        surfaceTintColor: Colors.transparent,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          color: enhancedCs.onSurface,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: enhancedCs.onSurface),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

      // Enhanced cards with better shadows
      cardTheme: CardThemeData(
        elevation: _cardElevationLight,
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.08),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: _radiusL),
        margin: EdgeInsets.zero,
      ),

      // Professional button styles
      filledButtonTheme: FilledButtonThemeData(
        style: _primaryButtonStyle(enhancedCs),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: _buttonElevationLight,
          backgroundColor: enhancedCs.surface,
          foregroundColor: enhancedCs.primary,
          shadowColor: Colors.black.withOpacity(0.1),
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          side: BorderSide(color: enhancedCs.outline, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          foregroundColor: enhancedCs.primary,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: enhancedCs.primary,
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Enhanced input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: enhancedCs.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintStyle: TextStyle(color: enhancedCs.onSurface.withOpacity(0.6)),
      ),

      // Enhanced chip theme
      chipTheme: base.chipTheme.copyWith(
        shape: const RoundedRectangleBorder(borderRadius: _radiusS),
        backgroundColor: enhancedCs.surfaceVariant,
        selectedColor: enhancedCs.primaryContainer,
        labelStyle: base.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        padding: _paddingM,
      ),

      // Enhanced tab bar
      tabBarTheme: TabBarThemeData(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: enhancedCs.primary, width: 3),
          insets: const EdgeInsets.symmetric(horizontal: 16),
        ),
        labelColor: enhancedCs.primary,
        unselectedLabelColor: enhancedCs.onSurface.withOpacity(0.7),
        labelStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),

      // Enhanced bottom sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: enhancedCs.surface,
        elevation: _dialogElevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
        dragHandleColor: enhancedCs.onSurfaceVariant.withOpacity(0.4),
      ),

      // Enhanced dialog
      dialogTheme: DialogThemeData(
        backgroundColor: enhancedCs.surface,
        elevation: _dialogElevation,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: _radiusXL),
        titleTextStyle: base.textTheme.headlineSmall?.copyWith(
          color: enhancedCs.onSurface,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: enhancedCs.onSurface.withOpacity(0.8),
          height: 1.5,
        ),
      ),

      // Enhanced snack bar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF2D3748),
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: _radiusM),
        elevation: 4,
      ),

      // Enhanced divider
      dividerTheme: DividerThemeData(
        color: enhancedCs.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // Enhanced list tile
      listTileTheme: ListTileThemeData(
        iconColor: enhancedCs.onSurface.withOpacity(0.8),
        textColor: enhancedCs.onSurface,
        contentPadding: _paddingL,
        shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      ),

      // Enhanced floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: enhancedCs.primary,
        foregroundColor: enhancedCs.onPrimary,
        elevation: 4,
        shape: const RoundedRectangleBorder(borderRadius: _radiusL),
      ),

      // Enhanced navigation bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: enhancedCs.surface,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.05),
        surfaceTintColor: Colors.transparent,
        indicatorColor: enhancedCs.primaryContainer,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          return base.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: states.contains(WidgetState.selected)
                ? enhancedCs.onPrimaryContainer
                : enhancedCs.onSurface.withOpacity(0.7),
          );
        }),
      ),
    );
  }

  static ThemeData get darkTheme {
    final ColorScheme cs = ColorScheme.fromSeed(
      seedColor: _darkSeed,
      brightness: Brightness.dark,
    );

    // Enhanced dark color scheme
    final enhancedCs = cs.copyWith(
      surface: const Color(0xFF0F1419), // Deep dark blue
      onSurface: const Color(0xFFE8E9EA), // Soft white
      surfaceVariant: const Color(0xFF1A1F24), // Darker variant
      outline: const Color(0xFF3A4047), // Subtle outline
      outlineVariant: const Color(0xFF2A2F34), // Even more subtle
    );

    final base = ThemeData(
      colorScheme: enhancedCs,
      scaffoldBackgroundColor: enhancedCs.surface,
      textTheme: _buildTextTheme(ThemeData.dark().textTheme, enhancedCs.onSurface, isDark: true),
      primaryColor: enhancedCs.primary,
      splashColor: enhancedCs.onSurface.withOpacity(0.08),
      highlightColor: enhancedCs.onSurface.withOpacity(0.04),
      useMaterial3: true,
    );

    return base.copyWith(
      // Dark AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF161B22),
        foregroundColor: enhancedCs.onSurface,
        elevation: _appBarElevationLight,
        centerTitle: false,
        shadowColor: Colors.black.withOpacity(0.3),
        surfaceTintColor: Colors.transparent,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          color: enhancedCs.onSurface,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: enhancedCs.onSurface),
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      // Dark cards
      cardTheme: CardThemeData(
        elevation: _cardElevationDark,
        color: const Color(0xFF1A1F24),
        shadowColor: Colors.black.withOpacity(0.4),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: _radiusL),
        margin: EdgeInsets.zero,
      ),

      // Dark buttons
      filledButtonTheme: FilledButtonThemeData(
        style: _primaryButtonStyle(enhancedCs, isDark: true),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: _buttonElevationDark,
          backgroundColor: enhancedCs.surfaceVariant,
          foregroundColor: enhancedCs.onSurface,
          shadowColor: Colors.black.withOpacity(0.3),
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          side: BorderSide(color: enhancedCs.outline, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          foregroundColor: enhancedCs.onSurface,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: enhancedCs.primary,
          shape: const RoundedRectangleBorder(borderRadius: _radiusM),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // Dark input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: enhancedCs.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: _radiusM,
          borderSide: BorderSide(color: enhancedCs.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        hintStyle: TextStyle(color: enhancedCs.onSurface.withOpacity(0.5)),
      ),

      // Dark chip theme
      chipTheme: base.chipTheme.copyWith(
        shape: const RoundedRectangleBorder(borderRadius: _radiusS),
        backgroundColor: enhancedCs.surfaceVariant,
        selectedColor: enhancedCs.primaryContainer,
        labelStyle: base.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        padding: _paddingM,
      ),

      // Dark tab bar
      tabBarTheme: TabBarThemeData(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: enhancedCs.primary, width: 3),
          insets: const EdgeInsets.symmetric(horizontal: 16),
        ),
        labelColor: enhancedCs.primary,
        unselectedLabelColor: enhancedCs.onSurface.withOpacity(0.7),
        labelStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: base.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),

      // Dark bottom sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: const Color(0xFF161B22),
        elevation: _dialogElevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
        dragHandleColor: enhancedCs.onSurfaceVariant.withOpacity(0.4),
      ),

      // Dark dialog
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF1A1F24),
        elevation: _dialogElevation,
        shadowColor: Colors.black.withOpacity(0.4),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: _radiusXL),
        titleTextStyle: base.textTheme.headlineSmall?.copyWith(
          color: enhancedCs.onSurface,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: enhancedCs.onSurface.withOpacity(0.8),
          height: 1.5,
        ),
      ),

      // Dark snack bar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF2A2F34),
        contentTextStyle: base.textTheme.bodyMedium?.copyWith(
          color: enhancedCs.onSurface,
          fontWeight: FontWeight.w500,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: _radiusM),
        elevation: 4,
      ),

      // Dark divider
      dividerTheme: DividerThemeData(
        color: enhancedCs.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      // Dark list tile
      listTileTheme: ListTileThemeData(
        iconColor: enhancedCs.onSurface.withOpacity(0.8),
        textColor: enhancedCs.onSurface,
        contentPadding: _paddingL,
        shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      ),

      // Dark floating action button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: enhancedCs.primary,
        foregroundColor: enhancedCs.onPrimary,
        elevation: 3,
        shape: const RoundedRectangleBorder(borderRadius: _radiusL),
      ),

      // Dark navigation bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF161B22),
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        surfaceTintColor: Colors.transparent,
        indicatorColor: enhancedCs.primaryContainer,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          return base.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: states.contains(WidgetState.selected)
                ? enhancedCs.onPrimaryContainer
                : enhancedCs.onSurface.withOpacity(0.7),
          );
        }),
      ),
    );
  }

  // Utility methods for custom button styles
  static ButtonStyle tonalFilledButtonStyle(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return _secondaryButtonStyle(cs, isDark: isDark);
  }

  static ButtonStyle destructiveButtonStyle(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return FilledButton.styleFrom(
      backgroundColor: cs.error,
      foregroundColor: cs.onError,
      shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      elevation: 1,
      shadowColor: cs.error.withOpacity(0.3),
    );
  }

  static ButtonStyle ghostButtonStyle(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    
    return TextButton.styleFrom(
      foregroundColor: cs.onSurface.withOpacity(0.8),
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: _radiusM),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );
  }
}