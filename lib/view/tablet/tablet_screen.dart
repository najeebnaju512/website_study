import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';
import '../widget/data_entry_feild.dart';
import '../widget/save_button.dart';

class TabletScreen extends StatelessWidget {
  TabletScreen({super.key});

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
      backgroundColor: Colors.white,
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: size.width * .22,
              color: ColorTheme.lightBlue,
              padding: const EdgeInsets.only(top: 63, right: 35, left: 35),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "asset/logo/logo.png",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 63),
              child: SizedBox(
                height: size.height,
                width: size.width * .5,
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BASIC DETAILS",
                        style: GlTextStyles.interStyl(
                            size: 32, weight: FontWeight.w700),
                      ),
                      const Spacer(),
                      Center(
                        child: Flexible(
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 16,
                                    mainAxisExtent: 120,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 50),
                            children: [
                              //validate min 3 lettoers needed
                              DataEntryField(
                                title: "First Name",
                                controller: firstnameControl,
                                formKey: firstnamekey,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 3) {
                                    return 'First name Should atleast Contains 3 Letters ';
                                  }
                                  return null;
                                },
                              ),
                              DataEntryField(
                                  title: "Last Name",
                                  controller: lastnameControl),
                              //if entered it has to be validated
                              DataEntryField(
                                title: "Email Address",
                                controller: mailControl,
                                formKey: mailKey,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  } else if (!value.contains('@') ||
                                      !value.contains('.com')) {
                                    return 'Enter a valid Email';
                                  }
                                  return null;
                                },
                              ),
                              //is required
                              DataEntryField(
                                title: "User ID",
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
                                  title: "District", controller: distControl),
                              DataEntryField(
                                title: "Phone No.",
                                controller: phoneControl,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              DataEntryField(
                                title: "Pincode",
                                controller: pinControl,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              DataEntryField(
                                  title: "Country", controller: countryControl),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: SizedBox(
                          width: size.width * .5,
                          child: Expanded(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
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
                                        style: GlTextStyles.interStyl(
                                            size: 24, weight: FontWeight.w600),
                                      )),
                                  SaveButton(
                                    size: size,
                                    fontsize: 14,
                                    minwidth: size.width * .12,
                                    shight: size.width * .045,
                                    swidth: size.width * .15,
                                    onpress: () {
                                      if (firstnamekey.currentState!
                                              .validate() &&
                                          mailKey.currentState!.validate() &&
                                          uidKey.currentState!.validate()) {
                                        //succsess
                                      } else {
                                        //failed
                                      }
                                    },
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.width * .05,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
