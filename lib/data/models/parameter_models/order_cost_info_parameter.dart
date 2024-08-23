import 'package:equatable/equatable.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/user_model.dart';

class OrderCostInfoParam{
  const OrderCostInfoParam({
    required this.formId,
     this.orderType,required this.orderTitle,
    required this.updatedAt,
    required this.orderInvoice
  });
  final int formId;
  final String? orderType;
  final String orderTitle;
  final String updatedAt;
  final InvoiceModel orderInvoice;
}
