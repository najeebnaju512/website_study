import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/text_styles.dart';
import 'widget/data_entry_feild.dart';
import 'widget/save_button.dart';
import '../controller.dart';

class CreateStudentTabletScreen extends StatelessWidget {
  final CreateStudentController controller;
  const CreateStudentTabletScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formkey,
          child: Padding(
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
                    SizedBox(
                      height: size.width * .1,
                    ),
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
                              controller: controller.firstnameControl,
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
                                controller: controller.lastnameControl),
                            //if entered it has to be validated
                            DataEntryField(
                              title: "Email Address",
                              controller: controller.mailControl,
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
                              controller: controller.uidControl,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter User Id";
                                }
                                return null;
                              },
                            ),
                            DataEntryField(
                                title: "District",
                                controller: controller.distControl),
                            DataEntryField(
                              title: "Phone No.",
                              controller: controller.phoneControl,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            DataEntryField(
                              title: "Pincode",
                              controller: controller.pinControl,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                            DataEntryField(
                                title: "Country",
                                controller: controller.countryControl),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * .1,
                    ),
                    Center(
                      child: SizedBox(
                        width: size.width * .5,
                        child: Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: controller.resetAll,
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
                                  onpress: controller.createStudent,
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
          ),
        ),
      ),
    );
  }
}
