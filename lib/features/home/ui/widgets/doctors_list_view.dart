import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/helpers/spacing.dart';
import 'package:flutter_complete_project/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_complete_project/features/home/ui/widgets/doctors_list_view_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? doctorsList;
  const DoctorsListView({super.key, required this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 300.h,
      child: ListView.builder(
        itemCount: doctorsList?.length,
          
          itemBuilder:(context, index){
            return DoctorsListViewItem(
              doctorsModle: doctorsList?[index],
            );
          }
      ),
    );
  }
}
