import 'package:flutter/material.dart';

/// ایپ کا مرکزی تھیم مینجمنٹ سسٹم (Balanced Light & Accent Themes)
class AppThemes {
  // ===========================================================================
  // 1. ماڈرن منیمل سلیٹ - کنٹراسٹ (Modern Minimal Slate - Balanced)
  // ===========================================================================
  static ThemeData get slateDarkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF0F172A),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F172A),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),

      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0F172A),
        secondary: Color(0xFF1E293B),
        surface: Colors.white,
        onPrimary: Colors.white,
        onSurface: Colors.black87,
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // ===========================================================================
  // 2. ڈیپ ایمرالڈ لکژری - کنٹراسٹ (Deep Emerald Luxury - Balanced)
  // ===========================================================================
  static ThemeData get deepEmeraldTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF064E3B),
      scaffoldBackgroundColor: const Color(0xFFF0FDFA),
      
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF064E3B),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),

      // 👈 یہاں غیر ضروری const ختم کر دیے گئے ہیں
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF064E3B),
        secondary: Color(0xFF047857),
        surface: Colors.white,
        onPrimary: Colors.white,
        onSurface: Colors.black87,
      ),

      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: const Color(0xFF064E3B).withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}