import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/home/logic/home_cubit.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_list_view.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../logic/home_state.dart';

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

              // const DoctorsSpecialityListView(),
              // verticalSpace(16.h),
              //
              // const DoctorsListView(),

              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) => current is SpecializationsLoading ||
                    current is SpecializationsSuccess ||
                    current is SpecializationsError ,
                  builder: (context, state){
                  return state.maybeWhen(
                      specializationsLoading: ()=> const SizedBox(
                        height: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ) ,
                      specializationsSuccess: (specializationsResponseModel){
                        var specializationsList =
                        specializationsResponseModel.specializationDataList;
                        return Column(
                          children: [
                            DoctorsSpecialityListView(
                              specializationDataList: specializationsList ?? [],
                            ),
                            verticalSpace(8),
                            DoctorsListView(
                              doctorsList: specializationsList?[0]?.doctorsList ?? [] ,
                            ),

                          ],
                        );
                      },
                      specializationsError: (errorHandler){

                        return const SizedBox.shrink();
                      },
                      orElse: (){
                        return const SizedBox.shrink();
                      }

                  );

              }),



            ],
          ),
        ),
      ),
    );
  }
}
