import 'package:flutter/material.dart';
import 'package:mb_school/screens/pages/page1.dart';
import 'package:mb_school/screens/pages/page2.dart';
import 'package:mb_school/screens/pages/page3.dart';
import 'package:mb_school/widgets/progress.dart';
import '../config/config.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late PFormController pformController;

  
  @override
  void initState() {
    super.initState();
    pformController = PFormController(3);
  }
  @override
  Widget build(BuildContext context){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(gradient:
                LinearGradient(colors: [Config.colors.gbColor, Colors.white],
                    begin: Alignment.topCenter,
                end: Alignment.bottomCenter)
            ),
            child: Column(
              children: const [
                SizedBox(height: 50),
                Text("S'enrgistrer")
              ],
            ),
          ),
          DraggableScrollableSheet(
              maxChildSize: .9,
              minChildSize: .5,
              initialChildSize: .6,
              builder: (ctx, controller){
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Config.colors.bgfondu,
                  borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PForm(
                          controller : pformController,
                          pages: [
                                  Page1(),
                                  Page2(),
                                  const Page3(),
                                ],
                          title: [
                            PTitle(title: "privates information",
                            subtitle: "Add our privates information",),
                            PTitle(title: "other information",
                            subtitle: "Add an other information",),
                            PTitle(title: "picture and user name",
                                subtitle: "Add picture and User name",),
                      ])
                    ],
                  ),
                ),
              );
          })
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){
                pformController.prevPage();
                setState(() {});
              },
              child: Visibility(
                visible: pformController.currentPage == -1 || pformController.currentPage == 0
                    ? false
                    : true,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Config.colors.gbColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 20,),
          InkWell(
              onTap: (){
                pformController.nextPage();
                setState(() {});
              },
              child: Visibility(
                  visible: pformController.currentPage == pformController.lenght - 1
                ? false
                : true,
                      child: Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Config.colors.gbColor,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
