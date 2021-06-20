import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final titleBold = GoogleFonts.montserrat(
      fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white);

  static final subtitle = GoogleFonts.montserrat(
      fontWeight: FontWeight.w500, fontSize: 15.0, color: Colors.white);
  
  static final darksubtitle = GoogleFonts.quicksand(
      fontWeight: FontWeight.w500, fontSize: 20.0, color: Colors.black87);

  static final description = GoogleFonts.montserrat(
      fontWeight: FontWeight.w400, fontSize: 15.0, color: Colors.grey[300]);
}
