import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:situraja_village_app/pages/welcome_page.dart';
import 'package:situraja_village_app/providers/aparatur_provider.dart';
import 'package:situraja_village_app/providers/post_provider.dart';
import 'package:situraja_village_app/providers/product_provider.dart';
import 'package:situraja_village_app/providers/slider_provider.dart';
import 'package:situraja_village_app/providers/pages_provider.dart';
import 'package:situraja_village_app/providers/photo_provider.dart';
import 'package:situraja_village_app/theme/app_theme.dart';
import 'pages/information_page.dart';
import 'pages/page_detail_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AparaturProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PagesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => PhotoProvider(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Web Desa Situraja',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const WelcomeScreen(),
        onGenerateRoute: (settings) {
          if (settings.name == '/information') {
            return MaterialPageRoute(
              builder: (context) => const InformationScreen(),
            );
          }
          if (settings.name == '/page-detail') {
            final args = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => PageDetailScreen(slug: args),
            );
          }
          return null;
        },
      ),
    );
  }
}