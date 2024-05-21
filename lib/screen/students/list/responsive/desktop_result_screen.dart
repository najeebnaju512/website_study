import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';
import '../../create/view.dart';
import '../../../../utils/color_theme.dart';
import '../../../../utils/text_styles.dart';
import 'widget/student_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
                        "NEW STUDENTS",
                        style: GlTextStyles.interStyl(
                            size: 35, weight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Flexible(
                          child: Obx(
                            () => GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      childAspectRatio: 1.2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      maxCrossAxisExtent: 200),
                              itemCount: students.value.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                return index == students.length
                                    ? GestureDetector(
                                        onTap: () {
                                          //need to change
                                          Get.to(const StudentsCreate());
                                        },
                                        child: Container(
                                          height: size.width*.2,
                                          
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: ColorTheme.darkgrey),
                                                color: ColorTheme.darkgrey
                                                    .withOpacity(.4),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.add_circle_outline,
                                                  size: size.width * .07,
                                                ),
                                                Text(
                                                  "Add New Student",
                                                  style: GlTextStyles.interStyl(
                                                      size: 16,
                                                      weight: FontWeight.w400),
                                                )
                                              ],
                                            )),
                                      )
                                    : StudentCard(
                                        firstname: students[index].firstname,
                                        lastname: students[index].lastname,
                                        mail: students[index].email,
                                        id: students[index].id,
                                        district: students[index].district,
                                        phone: students[index].phoneNumber,
                                        pincode: students[index].pincode,
                                        country: students[index].country);
                              },
                            ),
                          ),
                        ),
                      ),
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
