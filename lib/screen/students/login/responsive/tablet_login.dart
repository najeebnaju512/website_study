import 'package:flutter/material.dart';

import '../../../../utils/color_theme.dart';
import '../../../../utils/text_styles.dart';
import '../login_controller.dart';
import 'widget/login_entry_feild.dart';

class LoginTablet extends StatelessWidget {
  final LoginController controller;
  const LoginTablet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: Center(
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.width * .5,
                width: size.width * .5,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/image/loginbk.jpg"))),
              ),
              SizedBox(
                height: size.width * .3,
                width: size.width * .3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome Back!",
                          style: GlTextStyles.robotoStyl(
                              size: size.width * .025, weight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text: "\nLogin your account",
                                style: GlTextStyles.robotoStyl(
                                    size: size.width * .015,
                                    weight: FontWeight.w400))
                          ]),
                    ),
                    LoginEntryField(
                      hight: size.width*.042,
                      title: "Username or Email",
                      fontsize: size.width * .013,
                    ),
                    LoginEntryField(
                      hight: size.width*.042,
                      title: "Password",
                      fontsize: size.width * .013,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot Password",
                            style: GlTextStyles.robotoStyl(
                                size: size.width * .013,
                                weight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    MaterialButton(
                      onPressed: () {},
                      height: size.width * .042,
                      color: ColorTheme.drkBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Save & Proceed",
                          style: GlTextStyles.robotoStyl(
                              size: size.width * .013,
                              weight: FontWeight.w600,
                              color: ColorTheme.white),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
