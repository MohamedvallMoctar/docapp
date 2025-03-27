import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:flutter_complete_project/features/onboarding/widgets/get_started_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theming/styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  bottom: 30.h
                ),
                child:  Column(
                  children: [
                      DocLogoAndName(),
                    SizedBox(height: 30.h,),
                    const DoctorImageAndText(),
                    Column(
                      children: [
                        Text('Manage and schedule all of your medical appointements easily qith Docdoc to get a new experiment ',
                        style: TextStyles.font13GrayRegular,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.h,),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                          child: const GetStartedButton(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
          ),
        );

  }
}
