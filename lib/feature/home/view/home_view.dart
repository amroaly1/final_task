import 'package:final_task/core/constant/app_image.dart';
import 'package:final_task/feature/home/view/widget/home_body.dart';
import 'package:final_task/feature/home/view/widget/love_body.dart';
import 'package:final_task/feature/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<Widget> page = [
    const HomeBody(),
    const LoveBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          backgroundColor: const Color(0xffDCEEFA),
          selectedItemColor: const Color(0xff4D8C8C),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      AppImage.backgroundHomePage,
                    ),
                    fit: BoxFit.fill)),
            child: page[currentIndex]),
      ),
    );
  }
}
