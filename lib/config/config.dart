import 'package:flutter/material.dart';

class Config{
  static final colors = _Color();
  static final assets = _Asset();
  static final styles = _Style();

}

class  _Color{
  final primaryColor = const Color(0xFFFFFFFF);
  final gbColor = const Color(0xFF1daf95);
  final bgfondu = const Color(0xffe2f8ed);
  final primaryTextColor = const Color(0xFF1daf95);
  final secondTextColor = const Color(0xFFFFFFFF);
  final tirthTextColor = const Color(0xFF8B8888);
  final fieldTextColor = const Color(0xFFF5F3F3);
  final secondColorLogo = const Color(0xFF2F3A6B);
}

class _Asset{
  final splash_img = "assets/images/logo_splash.png";
  final logo_img = "assets/images/logo_unique.png";
  final vec_ensi = "assets/images/vector_enseignant.png";
  final vec_etu = "assets/images/vector_etudiant.png";
  final profile = "assets/images/profile.png";
  final start = "assets/images/start.png";
  final cours_dev_web = "assets/images/cours_dev_web.png";
  final loading = "assets/images/loading.gif";
}

class _Style{
  final titleStyle = TextStyle(
    fontSize: 16,
    color: Config.colors.secondColorLogo,
    fontWeight: FontWeight.bold,
    fontFamily: 'roboto_bold',
  );
}