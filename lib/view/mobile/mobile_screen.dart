import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';

import '../../utils/text_styles.dart';
import '../widget/data_entry_feild.dart';
import '../widget/save_button.dart';

class MobileScreen extends StatelessWidget {
  MobileScreen({super.key});

  final firstnameControl = TextEditingController();
  final mailControl = TextEditingController();
  final lastnameControl = TextEditingController();
  final uidControl = TextEditingController();
  final distControl = TextEditingController();
  final pinControl = TextEditingController();
  final phoneControl = TextEditingController();
  final countryControl = TextEditingController();
  final firstnamekey = GlobalKey<FormState>();
  final mailKey = GlobalKey<FormState>();
  final uidKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "asset/logo/logo.png",
          width: size.width * .3,
          height: size.width * .1,
        ),
        backgroundColor: ColorTheme.lightBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BASIC DETAILS",
                style: GlTextStyles.interStyl(size: 14, weight: FontWeight.w700),
              ),
              //validate min 3 lettoers needed
              DataEntryField(
                title: "First Name",
                fontsize: 12,
                controller: firstnameControl,
                formKey: firstnamekey,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'First name Should atleast Contains 3 Letters ';
                  }
                  return null;
                },
              ),
              DataEntryField(
                  title: "Last Name", fontsize: 12, controller: lastnameControl),
              //if entered it has to be validated
              DataEntryField(
                title: "Email Address",
                fontsize: 12,
                controller: mailControl,
                formKey: mailKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  } else if (!value.contains('@') || !value.contains('.com')) {
                    return 'Enter a valid Email';
                  }
                  return null;
                },
              ),
              //is required
              DataEntryField(
                title: "User ID",
                fontsize: 12,
                controller: uidControl,
                formKey: uidKey,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter User Id";
                  }
                  return null;
                },
              ),
              DataEntryField(
                  title: "District", fontsize: 12, controller: distControl),
              DataEntryField(
                title: "Phone No.",
                fontsize: 12,
                controller: phoneControl,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              DataEntryField(
                title: "Pincode",
                fontsize: 12,
                controller: pinControl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              DataEntryField(
                  title: "Country", fontsize: 12, controller: countryControl),
              const Spacer(),
              Center(
                child: SaveButton(
                  size: size,
                  fontsize: 12,
                  shight: 40,
                  swidth: size.width*.3,
                  minwidth: size.width*.3,
                  onpress: () {
                    if (firstnamekey.currentState!.validate() &&
                        mailKey.currentState!.validate() &&
                        uidKey.currentState!.validate()) {
                      //succsess
                    } else {
                      //failed
                    }
                  },
                ),
              ),
            SizedBox(height:size.width*.02),
              Center(
                child: TextButton(
                    onPressed: () {
                      firstnameControl.clear();
                      mailControl.clear();
                      lastnameControl.clear();
                      uidControl.clear();
                      distControl.clear();
                      pinControl.clear();
                      phoneControl.clear();
                      countryControl.clear();
                    },
                    child: Text(
                      "Reset All",
                      style:
                          GlTextStyles.interStyl(size: 12, weight: FontWeight.w600),
                    )),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
