import 'package:final_task/core/constant/app_color.dart';
import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/core/constant/app_style.dart';
import 'package:final_task/core/route/page_path.dart';
import 'package:final_task/core/widget/custom_button.dart';
import 'package:final_task/feature/home/model/docotor_model.dart';
import 'package:final_task/feature/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoveBody extends StatelessWidget {
  const LoveBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getFavoriteDocotor(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  "Favourite",
                  style: AppStyle.elMessiriBold26,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              state is HomeUserGetFavoirteDataLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListOfDocotor(
                        doctors:
                            BlocProvider.of<HomeCubit>(context).listofFavoirt,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class ListOfDocotor extends StatelessWidget {
  const ListOfDocotor({super.key, required this.doctors});
  final List<DocotorModel> doctors;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return DoctorCard(
            docotorModel: doctors[index],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 10.h,
          );
        },
        itemCount: doctors.length);
  }
}

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.docotorModel,
  });
  final DocotorModel docotorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.gray, width: 1.5),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: docotorModel.gender == 1
                    ? const AssetImage(AppImage.docorboy)
                    : const AssetImage(AppImage.docorgairl),
              ),
              SizedBox(
                width: 20.w,
              ),
              Text(
                "Dr: ${docotorModel.name}",
                style: AppStyle.elMessiriRegular20.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  await BlocProvider.of<HomeCubit>(context)
                      .deleteDoctor(context, docotorModel);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            text: "Details",
            height: 40.h,
            onTap: () {
              Navigator.pushNamed(context, PagePath.kDeatils,
                  arguments: docotorModel);
            },
          )
        ],
      ),
    );
  }
}
