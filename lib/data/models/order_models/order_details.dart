import 'package:intl/intl.dart';
import 'package:osta/data/models/order_models/field_value.dart';
import 'package:osta/data/models/order_models/form_main_info.dart';
import 'package:osta/data/models/order_models/invoice_model.dart';
import 'package:osta/data/models/order_models/offer_model.dart';


class OrderDetails{
  const OrderDetails({
   required this.orderId,
   required this.formMainInfo,
   required this.orderInvoice,
   required this.fields,
   required this.orderOffers,
   this.orderStatus,
   required this.createdAt
});

  final int orderId;
  final FormMainInfo formMainInfo;
  final InvoiceModel orderInvoice;
  final List<FieldValue> fields;
  final List<OfferModel> orderOffers;
  final String? orderStatus;
  final String createdAt;

  factory OrderDetails.fromJson(Map<String,dynamic>json)=>OrderDetails(
      orderId: json['id'],
      formMainInfo: FormMainInfo.fromJson(json['form']),
      orderInvoice: InvoiceModel.fromJson(json['invoice']),
      fields: List<FieldValue>.from(
          json['fields'].map((x) => FieldValue.fromJson(x))) ?? [],
      orderOffers: List<OfferModel>.from(
          json['offers'].map((x) => OfferModel.fromJson(x))) ?? [],
      createdAt: DateFormat("EEE, MMM d, yyyy").format(DateTime.parse(json['created_at']??''))
  );
  Map<String, dynamic> toJson() => {
    "id": orderId,
    "form": formMainInfo.toJson(),
    "invoice": orderInvoice.toJson(),
    "fields": fields,
    "offers":List<OfferModel>.from(orderOffers.map((e) => e.toJson())),
    "status": orderStatus,
    "created_at": createdAt
  };
}

