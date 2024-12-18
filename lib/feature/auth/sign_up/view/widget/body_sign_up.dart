import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/widget/custom_button.dart';
import 'package:final_task/core/widget/custom_text_form_filed.dart';
import 'package:final_task/feature/auth/sign_up/view_model/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodySignUP extends StatelessWidget {
  const BodySignUP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<SignupCubit>(context).globalKey,
          autovalidateMode:
              BlocProvider.of<SignupCubit>(context).autovalidateMode,
          child: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Sign Up',
                        style: AppStyle.elMessiriBold26,
                      ),
                      SizedBox(height: 60.h),
                      Text(
                        'Name',
                        style: AppStyle.elMessiriRegular16,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: BlocProvider.of<SignupCubit>(context)
                            .nameController,
                        validator:
                            BlocProvider.of<SignupCubit>(context).validatorName,
                        hintText: 'enter your name',
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Email',
                        style: AppStyle.elMessiriRegular16,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: BlocProvider.of<SignupCubit>(context)
                            .emailController,
                        validator: BlocProvider.of<SignupCubit>(context)
                            .validatorEmail,
                        hintText: 'enter email',
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'password',
                        style: AppStyle.elMessiriRegular16,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: BlocProvider.of<SignupCubit>(context)
                            .passwordController,
                        validator: BlocProvider.of<SignupCubit>(context)
                            .validatorPassword,
                        hintText: 'enter password',
                        obscureText:
                            BlocProvider.of<SignupCubit>(context).hidePassword,
                        suffixIcon: IconButton(
                            onPressed: BlocProvider.of<SignupCubit>(context)
                                .onPressIconPassword,
                            icon: Icon(BlocProvider.of<SignupCubit>(context)
                                .passwordIcon)),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Confirm password',
                        style: AppStyle.elMessiriRegular16,
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: BlocProvider.of<SignupCubit>(context)
                            .confirmPasswordController,
                        validator: BlocProvider.of<SignupCubit>(context)
                            .validatorConfirmPassword,
                        hintText: 'confirm password',
                        obscureText: BlocProvider.of<SignupCubit>(context)
                            .hideConfirmPassword,
                        suffixIcon: IconButton(
                            onPressed: BlocProvider.of<SignupCubit>(context)
                                .onPressIconConfirmPassword,
                            icon: Icon(BlocProvider.of<SignupCubit>(context)
                                .confirmPasswordIcon)),
                      ),
                      SizedBox(height: 40.h),
                      state is SignupLoding
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: AppColor.blue,
                            ))
                          : CustomButton(
                              text: 'Sign Up',
                              onTap: () async {
                                await BlocProvider.of<SignupCubit>(context)
                                    .onTapSignUp(context);
                              },
                            ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('You have an account ?   '),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, PagePath.kSignIn);
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
