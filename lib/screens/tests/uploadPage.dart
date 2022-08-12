import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mb_school/models/cours.dart';
import 'package:mb_school/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';

import '../../services/storageMethods.dart';


class UploadPage extends StatefulWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {




  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    final cours = Provider.of<List<CoursData>>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('cloud Storage'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final results = await ImagePicker()
                    .pickImage(source: ImageSource.gallery);

                if(results == null){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('No file selected'),
                      )
                  );
                }

                File file = File(results!.path);
                
                //storage.uploadFile(file!, fileName).then((value) => debugPrint('Done'));

                String photoProfilUrl = await StorageMethods()
                    .uploadImageToStorage("photoProfil", file, false);

                if (kDebugMode) {
                    print(" hello $photoProfilUrl");
                  }
                },
              child: Text('Upload image'),
            ),
          ),
          
          FutureBuilder(
            future: storage.listfiles(),
              builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
              if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(snapshot.data!.items[index].name),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.items.length,),
                );
              }
              if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasData){
                return const CircularProgressIndicator();
              }
              return Container();
              }),

          FutureBuilder(
              future: storage.downloadUrl('Splash.png'),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                  return Container(
                    width: 300,
                    height: 250,
                    child: Image.network(snapshot.data!,
                      fit: BoxFit.cover,),
                  );
                }
                if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasData){
                  return const CircularProgressIndicator();
                }
                return Container();
              }),
        ],
      ),
    );
  }
}


