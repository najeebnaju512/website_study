import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:nexteons_study_project/view/desktop/result_screen.dart';

import '../../controller/controller.dart';
import '../../utils/text_styles.dart';
import '../widget/data_entry_feild.dart';
import '../widget/save_button.dart';

class DesktopScreen extends StatelessWidget {
  DesktopScreen({super.key});

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
    final Controller controller = Get.put(Controller());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: double.infinity,
              width: size.width * .2,
              color: ColorTheme.lightBlue,
              padding: const EdgeInsets.only(top: 74, right: 54, left: 54),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "asset/logo/logo.png",
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 72),
              child: SizedBox(
                height: size.height,
                width: size.width * .65,
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BASIC DETAILS",
                        style: GlTextStyles.interStyl(
                            size: 35, weight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Flexible(
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 16,
                                    mainAxisExtent: 120,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 80),
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
                      SizedBox(
                        width: size.width * .65,
                        child: Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fontsize: 20,
                                minwidth: size.width * .12,
                                shight: size.width * .025,
                                swidth: size.width * .12,
                                onpress: () {
                                  if (firstnamekey.currentState!.validate() &&
                                      mailKey.currentState!.validate() &&
                                      uidKey.currentState!.validate()) {
                                    //succsess
                                    controller.addStudent(context,
                                        fname: firstnameControl.text,
                                        lname: lastnameControl.text,
                                        mail: mailControl.text,
                                        id: int.parse(uidControl.text),
                                        dist: distControl.text,
                                        phone: phoneControl.text,
                                        pin: int.parse(pinControl.text),
                                        country: countryControl.text);

                                        //need to change here
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text("Failed To Add Data",
                                            style: GlTextStyles.interStyl(
                                                color: ColorTheme.white,
                                                size: 12)),
                                        duration: const Duration(seconds: 5),
                                        margin: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height -
                                                100,
                                            right: 20,
                                            left: 20),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer()
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
