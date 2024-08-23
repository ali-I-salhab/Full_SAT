import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/core/utils/app_text_styles.dart';
import 'package:osta/data/models/worker_model.dart';
import 'package:osta/presentation/components/worker_components/details_row.dart';
import 'package:osta/presentation/components/worker_components/header_info_worker.dart';

class WorkerInfoCard extends StatelessWidget {
  const WorkerInfoCard({super.key,required this.worker});
  final WorkerModel worker;

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.all(12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        child: Column(
          children: [
            DetailsRow(detailName: 'worker.last_data_update'.tr(context), detailData: '11-12-2023'),
            SizedBox(height: 10.h,),
            Divider(),
            SizedBox(height: 8.h,),
            HeaderInfoWorker(image: worker.workerImage,jobType: worker.jobType,name: worker.workerName),
            SizedBox(height: 8.h,),
            Divider(),
            SizedBox(height: 16.h,),
            DetailsRow(detailName: 'common.location'.tr(context), detailData: worker.workerAddressDesc),
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DetailsRow(detailName: 'common.nationality'.tr(context), detailData: worker.workerNationality),
                SizedBox(width: 100.w,),
                DetailsRow(detailName: 'common.age'.tr(context), detailData: worker.workerAge),
              ],
            ),
            SizedBox(height: 16.h,),
            Divider(),
            SizedBox(height: 8.h,),
            DetailsRow(detailName: 'worker.targeted_monthly_salary'.tr(context), detailData: worker.workerSalary.toString() +'\$'),

          ],
        ),
      ),
    );
  }
}
