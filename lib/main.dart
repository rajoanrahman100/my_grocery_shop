import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/pages/category_list_page.dart';
import 'package:my_grocery_shop/pages/map_page.dart';
import 'package:my_grocery_shop/pages/onboarding_page.dart';
import 'package:my_grocery_shop/pages/welcome_page.dart';
import 'package:my_grocery_shop/service/loginservice.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    Provider(
      create: (_)=>LogInService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashWidget(duration: 3,gotoPage: OnBoardingPage(),),
      ),
    )
  );
}

/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashWidget(duration: 3,gotoPage: OnBoardingPage(),),
      //  home: MapPage(),
      // home: CategoryListPage(),
    );
  }
}
*/

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





