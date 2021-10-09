import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/pages/category_list_page.dart';
import 'package:my_grocery_shop/pages/welcome_page.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashWidget(duration: 3,gotoPage: WelcomeScreen(),),
      home: CategoryListPage(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  int duration = 0;
  Widget? gotoPage;

  SplashWidget({required this.duration, this.gotoPage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => gotoPage!),
      );
    });

    return Scaffold(
      body: Container(
        color: const Color(0xFF80C038),
        child: Center(
          child: IconFont(
            iconName: IconFontHelper.LOGO,
            color: Colors.white,
            iconSize: 100,
          ),
        ),
      ),
    );
  }
}





