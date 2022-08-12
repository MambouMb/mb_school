import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mb_school/utilitaire/imagePicker.dart';

import '../../config/config.dart';

class TestPick extends StatefulWidget {
  const TestPick({Key? key}) : super(key: key);

  @override
  State<TestPick> createState() => _TestPickState();
}

class _TestPickState extends State<TestPick> {
  File? image;

  Future pickImages() async {
    try{
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch(e) {
      print('failer to pick image : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Config.colors.bgfondu),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 300,
                child: image != null
                    ? Image.file(image!)
                : const FlutterLogo(size: 160),
              ),
              const SizedBox(height: 16),
              buildButton(
                  title: 'Pick Gallery',
                  icon: Icons.image_outlined,
                  onClicked: () => pickImages()),
              const SizedBox(
                height: 20,
              ),
              buildButton(
                  title: 'Pick camera',
                  icon: Icons.camera_alt_outlined,
                  onClicked: () {

                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildButton({
  required String title,
    required IconData icon,
    required VoidCallback onClicked,
}) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      primary: Colors.white,
      onPrimary: Colors.black,
      textStyle: const TextStyle(fontSize: 20),
    ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 20),
          Text(title),
        ],
      )
  );


}

