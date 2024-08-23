import 'package:flutter/material.dart';
import 'package:osta/core/localization/app_localizations.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/presentation/components/order_components/cost_detail_row.dart';

class OrderCostDetailsCard extends StatelessWidget {
  const OrderCostDetailsCard({super.key,required this.invoice});
  final InvoiceModel invoice;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          costNameRow(costName: 'order_details.sub_total'.tr(context), costDetail: '${invoice.cost} IQD'),
          FittedBox(child: costNameRow(costName: 'order_details.transport_cost'.tr(context), costDetail: '${invoice.transportCost} IQD')),
          costNameRow(costName: 'order_details.tax'.tr(context), costDetail: '${invoice.tax} IQD'),
          costNameRow(costName: 'order_details.discount'.tr(context), costDetail: '${invoice.discountCode ?? '0.0'} IQD'),
          Divider(
            indent: 20,
            endIndent: 20,
            thickness: 2,
          ),
          costNameRow(costName: 'common.total'.tr(context), costDetail: '${invoice.total} IQD'),
        ],
      ),
      );
  }
}
