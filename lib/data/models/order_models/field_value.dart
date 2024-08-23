class FieldValue{

  const FieldValue({
    required this.fieldId,
    required this.fieldName,
    required this.value,
    required this.label,
    required this.cost,
  });

  final int fieldId;
  final String fieldName;
  final String value;
  final String label;
  final double? cost;

  factory FieldValue.fromJson(Map<String,dynamic> json) => FieldValue(
    fieldId: json['id'],
    fieldName: json['name'],
    value: json['value'],
    cost: double.tryParse(json['cost']?? ''),
    label: json['label']
  );

  Map<String, dynamic> toJson() => {
      "id": fieldId,
      "name": fieldName,
      "value": value,
      "cost": cost,
      "label": label
  };


}