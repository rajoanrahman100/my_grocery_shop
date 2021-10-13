import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_grocery_shop/helper/constants.dart';
import 'package:my_grocery_shop/helper/icon_hepler.dart';
import 'package:my_grocery_shop/helper/utils.dart';
import 'package:my_grocery_shop/model/onboard_content.dart';
import 'package:my_grocery_shop/widgets/icon_font.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<OnBoardingContent> content = Utils.getOnBoarding();

  int pageIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: IconFont(
          color: kPrimaryColor,
          iconName: IconFontHelper.LOGO,
          iconSize: 30.0,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: PageView(
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  pageIndex = page;
                  debugPrint("page index $pageIndex");
                });
              },
              children: List.generate(content.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(40.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(color: kWhiteColor, borderRadius: BorderRadius.circular(20.0), boxShadow: [
                    BoxShadow(color: kPrimaryColor.withOpacity(0.3), blurRadius: 20, offset: Offset.zero)
                  ]),
                  child: Column(
                    children: [
                      Image.asset("assets/imgs/${content[index].img}.png"),
                      Expanded(
                        child: Text(
                          content[index].message!,
                          style: GoogleFonts.ubuntu(color: kPrimaryColor, fontSize: 25, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Visibility(
                        visible: index == content.length - 1,
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(color: kPrimaryColor.withOpacity(0.2), blurRadius: 10.0, offset: Offset.zero)
                              ]),
                          child: Text(
                            "Enter Now",
                            style: GoogleFonts.ubuntu(color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(content.length, (index) {
                return GestureDetector(
                  onTap: (){
                    _controller.animateTo(MediaQuery.of(context).size.width*index, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  child: Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: pageIndex==index ? kPrimaryColor : Theme.of(context).canvasColor, width: 2)),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: MaterialButton(
                onPressed: () {},
                child:
                    const Text("SKIP", style: TextStyle(color: kWhiteColor, fontWeight: FontWeight.w600, fontSize: 20)),
                color: kPrimaryColor,
                shape: const StadiumBorder(),
                height: 45,
                minWidth: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
