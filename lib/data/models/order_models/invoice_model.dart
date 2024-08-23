class InvoiceModel{

  const InvoiceModel({
    required this.tax,
     this.cost,this.discountCode,
    required this.transportCost,
    required this.total,
});

  final double tax;
  final double? cost;
  final double transportCost;
  final String? discountCode;
  final double total;

  factory InvoiceModel.fromJson(Map<String,dynamic> json) => InvoiceModel(
      tax: json['tax']?.toDouble() ?? 0.0,
      cost: json['cost']!=null ? json['cost']!.toDouble() : 0.0,
      discountCode: json['discount_coupon'],
      transportCost: json['transportation_cost']?.toDouble() ?? 0.0,
      total: json['total']?.toDouble() ?? 0.0
  );
  Map<String, dynamic> toJson() => {
    "tax": tax,
    "cost": cost,
    "discount_coupon":discountCode,
    "total": total
  };


}