
import 'package:flutter/material.dart';

import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.firstname,
    required this.lastname,
    required this.mail,
    required this.id,
    required this.district,
    required this.phone,
    required this.pincode,
    required this.country,
  });

  final String firstname;
  final String lastname;
  final String mail;
  final int id;
  final String district;
  final String phone;
  final int pincode;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorTheme.darkgrey),
          color: ColorTheme.darkgrey.withOpacity(.4),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$firstname $lastname",
            style: GlTextStyles.interStyl(size: 20, weight: FontWeight.w400),
          ),
          Text(
            mail,
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
          Text(
            "$id",
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
          Text(
            district,
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
          Text(
            phone,
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
          Text(
            "$pincode",
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
          Text(
            country,
            style: GlTextStyles.interStyl(size: 16, weight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
