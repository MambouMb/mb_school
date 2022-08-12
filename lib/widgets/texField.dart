import 'package:flutter/material.dart';

import '../config/config.dart';

class TField extends StatelessWidget{

  late TextEditingController? controller;
  late String hintText;
  late Widget? prefixIcon;
  late Widget? sufixIcon;
  bool isPasswordVisible = false;

   TField ({
     this.controller,
     required this.hintText,
      this.prefixIcon,
      this.sufixIcon,
   });

  @override
  Widget build (BuildContext context){
    return TextFormField(
          controller: controller,
          cursorColor: Config.colors.primaryTextColor,
          style: TextStyle(color: Config.colors.primaryTextColor, fontSize: 14.5),
          decoration: InputDecoration(
              fillColor: Config.colors.fieldTextColor,
              filled: true,
              prefixIconConstraints:
              const BoxConstraints(minWidth: 45),
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  fontFamily: "roboto_bold",
                  color: Config.colors.tirthTextColor, fontSize: 14.5),

              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Config.colors.gbColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:  BorderSide(color: Config.colors.gbColor))),
    )
    ;
  }
}

class TProgress extends StatelessWidget{
  late TextEditingController controller;
  late String hintText;
  late Widget prefix;

  TProgress({required this.controller,required this.hintText, required this.prefix});

  @override
  Widget build(BuildContext context){
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Config.colors.primaryTextColor, fontSize: 14.5),
      decoration: InputDecoration(
          fillColor: Config.colors.fieldTextColor,
          filled: true,
          prefixIconConstraints:
          const BoxConstraints(minWidth: 45),
          prefixIcon: prefix,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: "roboto_bold",
              color: Config.colors.tirthTextColor, fontSize: 14.5),

          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Config.colors.gbColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(color: Config.colors.gbColor))),
    );
  }
}



class PTField extends StatelessWidget{
  late final TextEditingController controller;
  bool isPasswordVisible = false;
  late final String hintText;
  late Widget suffix;
  late Widget prefix;

  PTField({required this.controller, required this.hintText, required this.prefix});

  @override
  Widget build (BuildContext context){
    return TextField(
      style: TextStyle(color: Config.colors.primaryTextColor, fontSize: 14.5),
      obscureText: isPasswordVisible ? false : true,
      decoration: InputDecoration(
          filled: true,
          fillColor: Config.colors.fieldTextColor,
          prefixIconConstraints:
          const BoxConstraints(minWidth: 45),
          prefixIcon: prefix,
          suffixIconConstraints:
          const BoxConstraints(minWidth: 45, maxWidth: 46),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
              fontFamily: "roboto_bold",
              color: Config.colors.tirthTextColor, fontSize: 14.5),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Config.colors.gbColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(color: Config.colors.gbColor))),
    );
  }
}


class titleFild extends StatelessWidget{

  late final String titre;
  late final String suivant;
  titleFild({required this.titre});

  @override
  Widget build (BuildContext context){
    return Container(
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
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titre,
                style: TextStyle(
                    color: Config.colors.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Roboto_bold'
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Row(
                  children: [
                    Text(
                        "See All",
                        style : TextStyle(
                            color: Config.colors.tirthTextColor,
                          fontFamily: 'roboto_bold',
                          fontWeight: FontWeight.bold
                        )
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Config.colors.tirthTextColor,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}