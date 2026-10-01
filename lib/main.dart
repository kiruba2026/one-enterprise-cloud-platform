import 'package:flutter/material.dart';

import 'routes/app_routes.dart';

void main() {
  runApp(const OneEnterpriseCloudPlatformApp());
}

class OneEnterpriseCloudPlatformApp extends StatelessWidget {
  const OneEnterpriseCloudPlatformApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OneCloud - Enterprise Platform',

      // Start on the Landing Page
      initialRoute: AppRoutes.landing,

      routes: AppRoutes.routes,

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1877F2)),
        scaffoldBackgroundColor: const Color(0xFFF4F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1877F2),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF1877F2)),
        ),
      ),
    );
  }
}
