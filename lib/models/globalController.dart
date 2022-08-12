import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final TextEditingController emailController = TextEditingController();
final TextEditingController passController= TextEditingController();
final TextEditingController confirmPassController= TextEditingController();
final TextEditingController phoneController= TextEditingController();
final TextEditingController locationController= TextEditingController();
final TextEditingController sexController= TextEditingController();
final TextEditingController fullnameController= TextEditingController();
File? imageProfil;
late User currentUser;
