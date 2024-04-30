import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajilah/constant/color_constant.dart';

class TextStyleCollection {
  static TextStyle poppinsBold = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: ColorCollection.darkGreen,
  );
  static TextStyle poppinsNormal = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: ColorCollection.darkGreen,
  );
}
