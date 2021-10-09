import 'package:flutter/material.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset(
                      "assets/imgs/of_main_bg.png",
                      fit: BoxFit.cover,
                    ))),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Container(
                      alignment: Alignment.center,
                      width: 180,
                      height: 180,
                      color: const Color(0xFF80C038),
                      child: IconFont(
                        iconName: IconFontHelper.MAIN_LOGO,
                        color: Colors.white,
                        iconSize: 130,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text(
                    "Grocerry Hut",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MaterialButton(
                      onPressed: (){},
                      shape: const StadiumBorder(),
                      height: 55,
                      minWidth: double.infinity,
                      color: const Color(0xFF80C038),
                      child: const Text("Try Now",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: MaterialButton(
                      onPressed: (){},
                      shape: const StadiumBorder(side: BorderSide(color: kPrimaryColor,width: 2)),
                      height: 55,
                      minWidth: double.infinity,
                      color: Colors.transparent,
                      child: const Text("Log In",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
