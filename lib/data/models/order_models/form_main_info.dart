class FormMainInfo{
  const FormMainInfo({
    required this.formId,
    required this.formTitle,
    required this.formType
});

  final int formId;
  final String formType;
  final String formTitle;
  factory FormMainInfo.fromJson(Map<String,dynamic> json) => FormMainInfo(
      formId: json['id'],
      formTitle: json['title'],
      formType: json['type']
  );
  Map<String, dynamic> toJson() => {
    "id": formId,
    "title": formTitle,
    "type": formType
  };
}