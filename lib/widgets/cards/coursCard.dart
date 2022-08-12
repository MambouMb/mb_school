import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mb_school/models/cours.dart';

import '../../config/config.dart';

class CoursCard extends StatelessWidget {
  const CoursCard(
      {Key? key,required this.cours})
      : super(key: key);

  final CoursData cours;


  @override
  Widget build(BuildContext context) {
    return Container(
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
        )
      ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(cours.vignette, fit: BoxFit.fill,),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: cours.cTitle,
                  style: Config.styles.titleStyle.copyWith(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "BY ${cours.author}",
                style: Config.styles.titleStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
              ),
              Text( cours.categorie,
                style: Config.styles.titleStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 5,
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
                    child: Icon(Icons.favorite_outline,
                      color: Config.colors.gbColor,
                      size: 25,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
