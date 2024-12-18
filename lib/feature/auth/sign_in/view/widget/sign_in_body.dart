import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/widget/custom_text_form_filed.dart';
import 'package:final_task/feature/auth/sign_in/view_model/cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widget/custom_button.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<SigninCubit>(context).globalKey,
          autovalidateMode:
              BlocProvider.of<SigninCubit>(context).autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'Sign In',
                style: AppStyle.elMessiriBold26,
              ),
              SizedBox(height: 60.h),
              Text(
                'Email',
                style: AppStyle.elMessiriRegular16,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller:
                    BlocProvider.of<SigninCubit>(context).emailController,
                validator: BlocProvider.of<SigninCubit>(context).validatorEmail,
                hintText: 'enter your email',
              ),
              SizedBox(height: 20.h),
              Text(
                'password',
                style: AppStyle.elMessiriRegular16,
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller:
                    BlocProvider.of<SigninCubit>(context).passwordController,
                validator:
                    BlocProvider.of<SigninCubit>(context).validatorPassword,
                hintText: 'enter your password',
                obscureText: BlocProvider.of<SigninCubit>(context).hidePassword,
                suffixIcon: IconButton(
                  onPressed:
                      BlocProvider.of<SigninCubit>(context).onPressIconPassword,
                  icon:
                      Icon(BlocProvider.of<SigninCubit>(context).passwordIcon),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PagePath.kResetPassword);
                    },
                    child: Text(
                      'Forget Password?',
                      style: AppStyle.elMessiriBold15.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30.h),
              state is SigninLoding
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.blue,
                      ),
                    )
                  : CustomButton(
                      text: 'Sign in',
                      onTap: () async {
                        await BlocProvider.of<SigninCubit>(context)
                            .onTapSignIn(context);
                      },
                    ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account ?   '),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, PagePath.kSignUp);
                    },
                    child: const Text(
                      'Sign Up',
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
        );
      },
    );
  }
}
