import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar_groceries_app/resources/auth_methods.dart';

import '../../widget/widgets.dart';
import '../constants/constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    //signup user using auth methods

    String response = await AuthMethods().signUpUser(
      userName: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (response == 'success') {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      context.replaceNamed(RouteConstants.navScreen);
    } else {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      showSnackBar(context, response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p20,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: Image.asset(ImageAssetManager.carrotColored)),
            const Gap(50),
            Text(
              StringManager.signup,
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.fs30),
            ),
            const Gap(15),
            Text(
              StringManager.enterCredentials,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs16),
            ),
            const Gap(40),
            Text(
              StringManager.username,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs16),
            ),
            const Gap(15),
            TextFieldInput(
                textEditingController: _usernameController,
                hintText: 'enter your username',
                textInputType: TextInputType.text),
            const Gap(40),
            Text(
              StringManager.email,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs16),
            ),
            const Gap(15),
            TextFieldInput(
                textEditingController: _emailController,
                hintText: 'enter your email',
                textInputType: TextInputType.emailAddress),
            const Gap(40),
            Text(
              StringManager.password,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs16),
            ),
            const Gap(15),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'enter your password',
              isPass: true,
              textInputType: TextInputType.text,
            ),
            const Gap(30),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                StringManager.forgotPassword,
                style: getRegularStyle(
                    color: ColorManager.black, fontSize: FontSize.fs16),
              ),
            ),
            const Gap(40),
            Center(
                child: InkWell(
                    onTap: signUpUser,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p24),
                      decoration: ShapeDecoration(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s20))),
                          color: ColorManager.green),
                      child: !_isLoading
                          ? Text(
                              StringManager.signup,
                              style: getRegularStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.fs20),
                            )
                          : CircularProgressIndicator(
                              color: ColorManager.white,
                            ),
                    ))),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringManager.alreadyhaveAnAccount,
                  style: getRegularStyle(
                      color: ColorManager.black, fontSize: FontSize.fs20),
                ),
                const Gap(5),
                GestureDetector(
                  onTap: () => context.replaceNamed(RouteConstants.loginScreen),
                  child: Text(
                    StringManager.login,
                    style: getRegularStyle(
                        color: ColorManager.green, fontSize: FontSize.fs20),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
