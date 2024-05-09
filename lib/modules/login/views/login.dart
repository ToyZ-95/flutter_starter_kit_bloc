import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_kit_bloc/configurations/app_configurations.dart';
import 'package:starter_kit_bloc/modules/login/bloc/login_bloc.dart';
import 'package:starter_kit_bloc/modules/login/repositories/login_repository.dart';
import 'package:starter_kit_bloc/repositories/user_repository.dart';
import 'package:starter_kit_bloc/routers/navigation_helper.dart';
import 'package:starter_kit_bloc/utils/utils.dart';
import 'package:starter_kit_bloc/widgets/custom_text_field.dart';
import 'package:starter_kit_bloc/widgets/height_box.dart';
import 'package:starter_kit_bloc/widgets/primary_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(loginRepository: LoginRepository()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            moveToHomeScreen(context: context);
          } else if (state is LoginErrorState) {
            Utils.showSnackbar(
              type: SnackBarType.error,
              context: context,
              message: state.errorData?.data["message"],
            );
          }
        },
        builder: (context, state) {
          LoginBloc loginBloc = context.read<LoginBloc>();

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: colorsConstants.whiteColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: colorsConstants.lightWhite,
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(
                            "Starter Kit ",
                            style: TextStyle(
                              color: colorsConstants.blackColor,
                              fontSize: 20.sp,
                            ),
                          ),
                          HeightBox(10.h),
                          CustomTextField(
                            hintText: "Email",
                            controller: loginBloc.emailTextEditingController,
                            textInputAction: TextInputAction.next,
                            maxLine: 1,
                            isRequired: true,
                          ),
                          HeightBox(10.h),
                          CustomTextField(
                            hintText: "Password",
                            controller: loginBloc.passwordTextEditingController,
                            textInputAction: TextInputAction.go,
                            maxLine: 1,
                            onSubmit: (_) => loginBloc.add(LoginEvent()),
                            isRequired: true,
                            obsecureText: true,
                            suffix: const Icon(Icons.visibility_off),
                          ),
                          HeightBox(20.h),
                          PrimaryButton(
                            title: "Login",
                            titleStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: colorsConstants.whiteColor,
                            ),
                            height: 50.h,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                loginBloc.add(LoginEvent());
                              }
                            },
                            child: state is LoginLoadingState
                                ? CircularProgressIndicator(
                                    color: colorsConstants.whiteColor,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
