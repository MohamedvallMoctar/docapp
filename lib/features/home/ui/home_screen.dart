import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(

        child: Container(
          width: double.infinity,
         // color: Colors.amber,
          margin: const EdgeInsets.fromLTRB(
              20.0,
              16.0,
              20.0,
              28.0,
          ),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(16.h),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16.h),

              const DoctorsSpecialityListView(),
              verticalSpace(16.h),

              const DoctorsListView(),




            ],
          ),
        ),
      ),
    );
  }
}
