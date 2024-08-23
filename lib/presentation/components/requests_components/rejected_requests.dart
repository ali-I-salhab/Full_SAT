import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osta/data/models/order_models/order_details.dart';
import 'package:osta/presentation/components/requests_components/request_card.dart';

class RejectedRequests extends StatelessWidget {
  const RejectedRequests({super.key, required this.requests});
  final List<OrderDetails> requests;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      requests.length != 0? Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: requests.length,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemBuilder: (context, index) {
                return RequsetCard(
                  isRejected: true,
                  request: requests[index],
                );
              }),
        )
            :Center(child: Text('There is no in-progress requests'),),
      ],
    );
  }
}
