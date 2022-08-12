import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/globalController.dart';
import '../../widgets/texField.dart';

class Page2 extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          TProgress(
            controller: phoneController,
              hintText: "Phone Number",
              prefix: const Icon(Icons.contact_phone)),
          const SizedBox(height: 15),

          TProgress(
            controller: locationController,
            hintText: 'Localisation',
            prefix: const Icon(
              Icons.location_city,
              size: 22,
            ),
          ),
          const SizedBox(height: 15),

          TProgress(
            controller: sexController,
            hintText: 'Sexe',
            prefix: const Icon(
              Icons.male,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}