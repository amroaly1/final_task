import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/widget/custom_button.dart';
import 'package:final_task/core/widget/custom_text_form_filed.dart';
import 'package:final_task/feature/auth/reset_password/view_model/cubit/resetpassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetpasswordCubit, ResetpasswordState>(
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<ResetpasswordCubit>(context).globalKey,
          autovalidateMode:
              BlocProvider.of<ResetpasswordCubit>(context).autovalidateMode,
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
                        'Reset Password',
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
                        controller: BlocProvider.of<ResetpasswordCubit>(context)
                            .emailController,
                        validator: BlocProvider.of<ResetpasswordCubit>(context)
                            .validatorEmail,
                        hintText: 'enter your email',
                      ),
                      SizedBox(height: 40.h),
                      CustomButton(
                        text: "Reset",
                        onTap: () async {
                          await BlocProvider.of<ResetpasswordCubit>(context)
                              .ontap(context);
                        },
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
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
