// ignore_for_file: unused_local_variable

import 'package:e_commerce_app/controller/auth/signup_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/alertexitapp.dart';
import 'package:e_commerce_app/core/functions/validinput.dart';
import 'package:e_commerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:e_commerce_app/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/handlingdata/handlingdataview.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('17'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              assignId: true,
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: <Widget>[
                        const SizedBox(height: 20),
                        CustomTextTitleAuth(text: "10".tr),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(text: "24".tr),
                        const SizedBox(height: 15),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return validInput(val!, 3, 20, "name");
                          },
                          mycontroller: controller.name,
                          hinttext: "23".tr,
                          iconData: Icons.person_outline,
                          labeltext: "20".tr,
                          // mycontroller: ,
                        ),
                        CustomTextFormAuth(
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 3, 40, "email");
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "18".tr,
                          // mycontroller: ,
                        ),
                        CustomTextFormAuth(
                          isNumber: true,
                          valid: (val) {
                            return validInput(val!, 7, 11, "phone");
                          },
                          mycontroller: controller.phone,
                          hinttext: "22".tr,
                          iconData: Icons.phone_android_outlined,
                          labeltext: "21".tr,
                          // mycontroller: ,
                        ),
                        // GetBuilder<SignUpControllerImp>(
                        //     builder: (controller) =>
                        CustomTextFormAuth(
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          isNumber: false,

                          valid: (val) {
                            return validInput(val!, 3, 30, "password");
                          },

                          mycontroller: controller.password,
                          hinttext: "13".tr,
                          iconData: Icons.lock_outline,
                          labeltext: "19".tr,
                          // mycontroller: ,
                        ),
                        //),
                        CustomButtonAuth(
                            text: "17".tr,
                            onPressed: () {
                              controller.signUp();
                            }),
                        const SizedBox(height: 40),
                        CustomTextSignUpOrSignIn(
                          textone: "25".tr,
                          texttwo: "26".tr,
                          onTap: () {
                            controller.goToSignIn();
                          },
                        ),
                      ]),
                    ),
                  ))),
        ));
  }
}
