import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.docotorModel});
  final DocotorModel docotorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImage.backgroundHomePage),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 70.h),
                Center(
                  child: CircleAvatar(
                    radius: 70.r,
                    backgroundImage: docotorModel.gender == 1
                        ? const AssetImage(AppImage.docorboy)
                        : const AssetImage(AppImage.docorgairl),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Name :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.name,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Phone :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.phone,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Email :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.email,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Location :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.location,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Age :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.age,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(height: 15.h),
                Text(
                  "Desciption :",
                  style: AppStyle.elMessiriRegular20black,
                ),
                Text(
                  docotorModel.description,
                  style: AppStyle.elMessiriBold20,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
