import 'package:hrapp/core/constant/edge_insets.dart';
import 'package:hrapp/core/services/navigation_service.dart';
import 'package:hrapp/product/constant/colors.dart';
import 'package:hrapp/core/mixin/password_visible.dart';
import 'package:hrapp/product/widgets/button/elevated_icon.dart';
import 'package:hrapp/product/widgets/text_fields.dart';
import 'package:hrapp/product/widgets/title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/size.dart';
import '../../../product/constant/font_size.dart';
import '../../../product/constant/icons.dart';
import '../../../product/constant/string_data.dart';
import '../../../product/constant/weight.dart';
import '../../../product/widgets/sized_box/box_space.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with PasswordVisibilityMixin {
  // bool isVisible = false;
  NavigationService nav = NavigationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const ProjectPadding.allEightteen(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  apptitle(),
                  BoxSpace(
                    height: ProjectSize.veryBigHeight().height,
                  ),
                  Column(
                    children: [
                      forms(),
                      Divider(
                        color: MyColor.veryLightBlack,
                        height: ProjectSize.bigHeight().height,
                      ),
                      termsAndConditions(context),
                      BoxSpace(
                        height: ProjectSize.bigHeight().height,
                      ),
                      registerButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container termsAndConditions(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Text.rich(
          TextSpan(
            text: StringData.termsText,
            style: const TextStyle(
              fontSize: ProjectFontSize.mainSize,
              color: MyColor.black,
            ),
            children: [
              TextSpan(
                text: StringData.terms,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.purplishBlue,
                  fontWeight: Weight.bold,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    nav.showBottomModal(
                      context,
                      StringData.termsSheetTitle,
                      StringData.termsSheetText,
                    );
                  },
              ),
              TextSpan(
                text: StringData.and,
                style: const TextStyle(
                  fontSize: ProjectFontSize.mainSize,
                  color: MyColor.black,
                ),
                children: [
                  TextSpan(
                    text: StringData.condition,
                    style: const TextStyle(
                      fontSize: ProjectFontSize.mainSize,
                      color: MyColor.purplishBlue,
                      fontWeight: Weight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        nav.showBottomModal(
                          context,
                          StringData.conditionsTitle,
                          StringData.conditionsText,
                        );
                      },
                  ),
                ],
              ),
              const TextSpan(
                text: StringData.termsTextEnd,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align apptitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: title(),
    );
  }

  Titles title() {
    return const Titles(
      title: StringData.registerHere,
      subtitle: StringData.registerNow,
    );
  }

  Form forms() {
    return Form(
      child: Column(
        children: [
          TextFields(
            listener: (value) {
              return;
            },
            validator: (value) {
              return null;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              MyIcons.user,
              color: MyColor.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.name,
          ),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          TextFields(
            listener: (value) {
              return;
            },
            validator: (value) {
              return null;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              MyIcons.mail,
              color: MyColor.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.email,
          ),
          BoxSpace(
            height: ProjectSize.bigHeight().height,
          ),
          TextFields(
            validator: (value) {
              return null;
            },
            listener: (value) {
              return;
            },
            titlePadding: const ProjectPadding.textFieldTitle(),
            icon: const Icon(
              MyIcons.password,
              color: MyColor.black,
            ),
            secure: isVisible,
            suffixButton: IconButton(
              onPressed: () {
                changeVisibility();
              },
              icon: isVisible
                  ? const Icon(
                      MyIcons.visibilityOn,
                    )
                  : const Icon(
                      MyIcons.visibilityOff,
                    ),
              color: Colors.black,
            ),
            fontWeight: Weight.midium,
            info: StringData.password,
          ),
        ],
      ),
    );
  }

  MyElevatedIcons registerButton() {
    return MyElevatedIcons(
      buttonName: StringData.register,
      icons: const Icon(MyIcons.addPerson),
      onPressed: onpressed,
    );
  }

  onpressed() {
    // Navigator.pop(context);
  }
}