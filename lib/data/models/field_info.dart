import 'package:equatable/equatable.dart';
import 'package:osta/data/models/category_model.dart';

class ServiceFields{

  const ServiceFields({
    required this.catMainInfo,
    required this.serviceFields
  });

  final CategoryModel catMainInfo;
  final List<FieldInfo> serviceFields;

  factory ServiceFields.fromJson(Map<String,dynamic> json)=>ServiceFields(
    catMainInfo: CategoryModel.fromJson(json['form']),
    serviceFields: List<FieldInfo>.from(
        json['form']['columns'].map((x) => FieldInfo.fromJson(x))) ?? [],

  );

  Map<String, dynamic> toJson() => {
    "form": {
      "id":catMainInfo.catId,
      "title": catMainInfo.catTitle,
      "desc": catMainInfo.catDescription,
      "icon": catMainInfo.catLogo,
      "columns" : List<FieldInfo>.from(serviceFields.map((e) => e.toJson()))
    }

  };
}

class FieldInfo extends Equatable{
  const FieldInfo({
    required this.name,
     this.label,
     this.type,
     this.placeholder,
    this.defaultVal,
    this.min,this.max,
    this.value,
    this.options,
    this.selectedValue,
    this.price,this.validation
});
  final String name;
  final String? label;
  final String? type;
  final String? placeholder;
  final String? defaultVal;
  final String? min;
  final String? max;
  final bool? value;
  final List<Option>? options;
  final int? selectedValue;
  final double? price;
  final List<String>? validation;

  factory FieldInfo.fromJson(Map<String, dynamic> json) => FieldInfo(
    name: json['name'],
    label: json['label'],
    type: json['type'] ,
    placeholder: json['placeholder'],
    defaultVal: json['default'],
    value: json['value'],
    options: json['options'] != null ? List<Option>.from(
        json['options'].map((x) => Option.fromJson(x))) : [],
    selectedValue: json['selectedValue'],
    max: json['max'],
    min: json['min'],
    price: json['price']?.toDouble(),
    validation: json['validation']
  );

  Map<String, dynamic> toJson() => {
    "name":name,
    "label":label,
    "type":type,
    "placeholder" :placeholder
  };

  @override
  List<Object?> get props =>[this.name,this.options,this.placeholder,this.min,this.max,this.value,this.type,this.label];
}
class Option extends Equatable{
  const Option({
    required this.optionValue,
    required this.optionLabel,
    required this.optionPrice,
});
  final String? optionValue;
  final String optionLabel;
  final double optionPrice;
  factory Option.fromJson(Map<String, dynamic> json) => Option(
      optionValue: json['value'],
      optionLabel: json['label'],
    optionPrice: json['price']?.toDouble() ?? 0.0
        );

  Map<String, dynamic> toJson() => {
    "value":optionValue,
    "label":optionLabel,
    "price":optionPrice
     };

  @override
  // TODO: implement props
  List<Object?> get props => [this.optionValue,this.optionLabel];

}