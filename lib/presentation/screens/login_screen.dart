import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/all_path.dart';

import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    //sign in user
    String response = await AuthMethods().signInUser(
        email: _emailController.text, password: _passwordController.text);
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
    return SafeArea(
      child: Scaffold(
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
              const Gap(40),
              Text(
                StringManager.login,
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.fs30),
              ),
              const Gap(15),
              Text(
                StringManager.enterEmailAndPassword,
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: FontSize.fs16),
              ),
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
                      onTap: loginUser,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p24),
                        decoration: ShapeDecoration(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.s20))),
                            color: ColorManager.green),
                        child: !_isLoading
                            ? Text(
                                StringManager.login,
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
                    StringManager.dontHaveAnAccount,
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                  const Gap(5),
                  GestureDetector(
                    onTap: () =>
                        context.replaceNamed(RouteConstants.signupScreen),
                    child: Text(
                      StringManager.signup,
                      style: getRegularStyle(
                          color: ColorManager.green, fontSize: FontSize.fs20),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
