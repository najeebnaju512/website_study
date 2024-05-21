import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/view/desktop/desktop_screen.dart';

import '../../controller/controller.dart';
import '../../utils/color_theme.dart';
import '../../utils/text_styles.dart';
import '../widget/student_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
                        "NEW STUDENTS",
                        style: GlTextStyles.interStyl(
                            size: 35, weight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Flexible(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 1.2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10),
                            itemCount: controller.students.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              return index == controller.students.length
                                  ? GestureDetector(
                                      onTap: () {
                                        //need to change
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context)=>DesktopScreen()));
                                      },
                                      child: Container(
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
                                      firstname: controller
                                          .students[index].firstname,
                                      lastname:
                                          controller.students[index].lastname,
                                      mail: controller.students[index].email,
                                      id: controller.students[index].id,
                                      district:
                                          controller.students[index].district,
                                      phone: controller
                                          .students[index].phoneNumber,
                                      pincode:
                                          controller.students[index].pincode,
                                      country:
                                          controller.students[index].country);
                            },
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
