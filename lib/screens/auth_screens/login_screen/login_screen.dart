import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:piggypaisa/common/common_path_list.dart';
import 'package:piggypaisa/widgets/common_statefulwapper.dart';

import '../../../Backend/APIs.dart';
import '../../../Global_values.dart';
import '../../../common/assets/index.dart';
import '../../../common/extension/spacing.dart';
import '../../../common/theme/scale.dart';
import '../../../config.dart';
import 'package:piggypaisa/plugin_list.dart';

import '../../../provider/auth_provider/login_provider.dart';
import '../../../routes/index.dart';
import '../../../utils/common_function.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widgets.dart';
import '../../../widgets/direction_page.dart';
import 'layout/richtext_login_layout.dart';
import 'layout/textfield_layout.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return Loginscreen_state();
  }
}
class Loginscreen_state extends State<LoginScreen>
{

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context1, login, child) {
      return StatefulWrapper(
        //load page
        onInit: () => Future.delayed(const Duration(milliseconds: 10))
            .then((_) => login.onReady(context)),
        //direction layout
        child: DirectionLayout(
            dChild: Scaffold(
                backgroundColor: appColor(context).appTheme.primaryColor,
                body: SafeArea(
                    child: SingleChildScrollView(
                        child: Stack(children: [
                          Image.asset(imageAssets.background),
                          Form(
                              key: login.loginKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        //login top text layout
                                        CommonWidget()
                                            .commonTextLoginRegistration(context),
                                        //textfield layout
                                        const TextFieldLayout(),
                                      ],
                                    ),
                                    VSpace(MediaQuery.of(context).size.height * 0.065),
                                    //login button click event
                                    ButtonCommon(
                                        title: language(context, appFonts.signIn),
                                        onTap: () {
                                          if (login.emailController.text == "" || login.passwordController.text == "") {
                                            Fluttertoast.showToast(msg: "please! Fill the Email and password",
                                                backgroundColor: Colors.red,textColor: Colors.white);
                                          }
                                          else
                                          {
                                            sign_in_method(login.email_v == true?login.emailController.text:login.emailController.text,login.passwordController.text);
                                            _onLoading2();
                                            login.onLogin(context);
                                          }
                                        }),
                                    const VSpace(Sizes.s30),
                                    Image.asset(imageAssets.oR),
                                    const VSpace(Sizes.s30),
                                    //bottom integration button and sign up account link layout
                                    const RichTextLayoutLogin()
                                  ]).paddingSymmetric(horizontal: Sizes.s20))
                        ]))))),
      );
    });
  }
  void _onLoading2() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        new Future.delayed(new Duration(seconds: 5), () {
          Navigator.of(context).pop();
          if (sign_in_success == true ) {
            if (userrole_dispaly == "parent" || userrole_dispaly == "guardian") {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ParentHomeScreen()));
            }
            if (userrole_dispaly ==  'child') {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChildHomeScreen()));
            }
          }
          else
          {
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ErrorScreen(errorMessage: "Login Failed! Try Again")));
          }
          setState(() {});
        });
        return AlertDialog(
          backgroundColor: Colors.blueGrey,
          title: Container(
            height: 100,
            width: 100,
            child: new Center(
              child: CircularProgressIndicator()
            ),
          ),
        );

      },
    );
  }
}
