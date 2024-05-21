import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../../../utils/color_theme.dart';
import '../../../../utils/constant/app_const.dart';
import '../../../../utils/text_styles.dart';
import 'widget/student_card.dart';

class DesktopResultScreen extends StatelessWidget {
  const DesktopResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                          childAspectRatio: .05,
                          mainAxisExtent: size.width * .14,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          maxCrossAxisExtent: size.width * .13,
                        ),
                        itemCount: students.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index == students.length
                              ? GestureDetector(
                                  onTap: () {
                                    //need to change
                                    GoRouter.of(navigatorKey.currentContext!).go('/create');
                                  },
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                        side: const BorderSide(width: 1)),
                                    color: ColorTheme.darkgrey
                                        .withOpacity(.8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          size: size.width * .07,
                                          color: ColorTheme.black
                                              .withOpacity(.6),
                                        ),
                                        Text(
                                          "Add New Student",
                                          style: GlTextStyles.interStyl(
                                              color: ColorTheme.black
                                                  .withOpacity(.6),
                                              size: size.width * .01,
                                              weight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : StudentCard(
                                  firstname: students[index].firstname,
                                  lastname: students[index].lastname,
                                  mail: students[index].email,
                                  id: students[index].id,
                                  district: students[index].district,
                                  phone: students[index].phoneNumber,
                                  pincode: students[index].pincode,
                                  country: students[index].country,
                                  titleFontSize: size.width * .013,
                                  subFontsize: size.width * .01,
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
