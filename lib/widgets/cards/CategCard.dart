import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mb_school/common/loading.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:mb_school/services/storage_service.dart';

import '../../config/config.dart';

class CategCard extends StatefulWidget {
  @override
  _CategCardState createState() => _CategCardState();
}

class _CategCardState extends State<CategCard> {
  CollectionReference categref = FirebaseFirestore.instance
      .collection('categories');
  final Storage storage = Storage();


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder(
            future: categref.get(),
            builder: (context,AsyncSnapshot snapshot) {
              // snapshot.connectionState == ConnectionState.waiting
              // snapshot.hasData
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                color: Colors.black.withOpacity(.1),
                                offset: const Offset(10, 10),
                              )
                            ]),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 60,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: CachedNetworkImage(
                                        imageUrl: '${snapshot.data.docs[index]
                                            .data()['imageName']}',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Image.asset(Config.assets.loading),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                        height: 100,
                                        width: 100,
                                      ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    text: ("${snapshot.data.docs[index]
                                        .data()['nom']}"),
                                    style: TextStyle(
                                        color: Config.colors.tirthTextColor,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                    );
                  },
                );
              } else if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();

              }
              else{
                return Container(
                  child: Text('Text'),
                );
              }
            }
        ),
      ),
    );
  }

}
