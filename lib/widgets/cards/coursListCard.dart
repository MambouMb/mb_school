import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/models/cours.dart';

import '../../common/loading.dart';
import '../../config/config.dart';
import 'coursCard.dart';

class CoursList extends StatefulWidget {
  @override
  _CoursListState createState() => _CoursListState();
}

class _CoursListState extends State<CoursList> {
  List<CoursData> _coursList = [];
  CollectionReference dataref = FirebaseFirestore.instance
      .collection('cours');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCoursList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: dataref.get(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index){
                  //return Text("${snapshot.data.docs[index].data()['titre']}");
                  return Container(
                    margin: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(.1),
                            offset: const Offset(10, 10),
                          ),
                        ]),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: SizedBox(
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: '${snapshot.data.docs[index]
                                        .data()['Cphoto']}',
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Image.asset(Config.assets.loading),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: ("${snapshot.data.docs[index].data()['titre']}"),
                                style: Config.styles.titleStyle.copyWith(fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "BY ${snapshot.data.docs[index].data()['author']}",
                              style: Config.styles.titleStyle.copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text( "${snapshot.data.docs[index].data()['categorie']}",
                              style: Config.styles.titleStyle.copyWith(fontSize: 13),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                    Icon(
                                      EvaIcons.star,
                                      color: Colors.orangeAccent,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: 20,
                                  height: 20,
                                  child: IconButton(
                                      onPressed: (){}, icon: const Icon(
                                      Icons.favorite_outline,
                                      size: 25),
                                    color: Colors.red,
                                    tooltip: 'Add favorite',
                                ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator(color: Config.colors.primaryTextColor,);
            }
            else{
              return const Center(
                child: Text('Error Connection'),
              );
            }
          }
          ),
    );
  }

  Future getCoursList() async {
    final uid = "1tKUog9ki8sIjxgQfRgq";
    var data = await FirebaseFirestore.instance
        .collection('cours')
        .orderBy('rating', descending: true)
        .get();
    setState(() {
      _coursList = List.from(data.docs.map((doc) => CoursData.fromSnapshot(doc)));
    });
  }
}
