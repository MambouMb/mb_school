import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mb_school/services/DataController.dart';
import 'package:mb_school/widgets/cards/coursCard.dart';

import '../../../config/config.dart';
import '../../../models/cours.dart';
import '../../../widgets/cards/CategCard.dart';
import '../../../widgets/texField.dart';
import '../../../widgets/cards/coursListCard.dart';

class HomeS extends StatefulWidget {
  const HomeS({Key? key}) : super(key: key);

  @override
  State<HomeS> createState() => _HomeSState();
}

class _HomeSState extends State<HomeS> {
  List<Object> _coursList = [];
  final _fireStore = FirebaseFirestore.instance;
  final db = FirebaseFirestore.instance;
  CollectionReference dataref = FirebaseFirestore.instance.collection('cours');

  Future getCoursList() async {
    final uid = "1tKUog9ki8sIjxgQfRgq";
    var data = await FirebaseFirestore.instance
        .collection('cours')
        .orderBy('rating', descending: true)
        .get();
    setState(() {
      _coursList =
          List.from(data.docs.map((doc) => CoursData.fromSnapshot(doc)));
    });
    return _coursList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCoursList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 125,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                  Container(
                    height: 90,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            color: Colors.black12.withOpacity(.2),
                            offset: const Offset(2, 2)),
                      ],
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Config.colors.bgfondu,
                    ),
                    child: Text('All',
                        style: TextStyle(
                            fontFamily: "roboto_bold",
                            color: Config.colors.secondTextColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    top: 60,
                    left: 30,
                    right: 30,
                    child: Container(
                      height: 53,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: Colors.black12.withOpacity(.2),
                              offset: const Offset(2, 2))
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Config.colors.gbColor,
                      ),
                      child: TField(hintText: "Search", prefixIcon: const Icon(Icons.search),),
                    ),
                  ),
                ],
              ),

              titleFild(titre: "Top cours"),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(height: 255, width: 500, child: CoursList())),
              const SizedBox(
                height: 10,
              ),
              titleFild(titre: "Cours categorie"),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                      height: 280,
                      width: 420,
                      child: CategCard())),
              //CategCard(),
            ],
          )),
        ));
  }
}
