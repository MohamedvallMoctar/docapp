import 'package:flutter/material.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_speciality_list_view_itam.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationDataList;

  const DoctorsSpecialityListView({super.key, required this.specializationDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context, index){
          return DoctorsSpecialityListViewItam(
              specializationsData: specializationDataList[index],
              itemIndex: index,
            );
        },
      ),

    );
  }
}
