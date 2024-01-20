import 'package:admin_beauty_app/Controller/Auth%20controller/auth_controller.dart';
import 'package:admin_beauty_app/View/Pages/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/constants.dart';
import '../../Reusable Components/reusable_text.dart';
import '../../Reusable Components/reusable_txt_field.dart';
import 'Components/Reusable Components/login_btn.dart';
import 'data.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    double height = screenHeight(context);
    double width = screenWidth(context);
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        color: themeLightColor,
        padding: EdgeInsets.only(top: height * 0.1),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/images/login icon.png',
                height: height * 0.12,
                width: width * 0.24,
              ),
              Column(
                children: [
                  ReusableText(
                    weight: FontWeight.w600,
                    fontSize: width * 0.065,
                    lbl: 'Beauty',
                    clr: Colors.black,
                  ),
                  ReusableText(
                      weight: FontWeight.w500,
                      fontSize: width * 0.025,
                      clr: Colors.black,
                      lbl: 'The Beauty App'),
                ],
              ),
              SizedBox(
                height: height * 0.0,
              ),
              for (int i = 0; i < 2; i++)
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.073,
                    right: width * 0.073,
                    top: height * 0.05,
                  ),
                  child: Material(
                    child: TxtField(
                        textEditingController: txtControllers[i],
                        label: hintTxt[i],
                        keyboardType: TextInputType.emailAddress,
                        fieldIcon: Icon(
                          iconsList[i],
                          size: width * 0.055,
                          color: Colors.black.withOpacity(0.4),
                        ),
                        errorMessage: errorMsj[i]),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  Get.to(const HomeScreen(), transition: Transition.fadeIn);
                  if (_formKey.currentState!.validate()) {
                    authController.login(
                        loginEmailTextController.text.toString(),
                        loginPasswordTextController.text.toString());
                  }
                },
                child: LoginBtn(
                  screenWidth: width,
                  screenHeight: height,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
