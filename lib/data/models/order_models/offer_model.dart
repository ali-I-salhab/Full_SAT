class OfferModel{

  const OfferModel({
    required this.status,
    required this.price,
    required this.offerId,
    required this.worker
  });

  final int offerId;
  final double price;
  final String status;
  final Worker worker;

  factory OfferModel.fromJson(Map<String,dynamic> json) => OfferModel(
      status: json['status'], price: json['price'].toDouble(), offerId: json['id'], worker: Worker.fromJson(json['user'])
  );
  Map<String, dynamic> toJson() => {
    "id": offerId,
    "price": price,
    "status": status,
    "user": worker.toJson()
  };


}

class Worker{

  const Worker({
    required this.workerId,
    required this.workerName,

  });

  final int workerId;
  final String workerName;

  factory Worker.fromJson(Map<String,dynamic> json) => Worker(
      workerId: json['id'], workerName: json['name']
  );
  Map<String, dynamic> toJson() => {
    "id": workerId,
    "name": workerName,
  };


}