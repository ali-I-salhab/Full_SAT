import 'package:equatable/equatable.dart';

class LanguageKeyModel extends Equatable{
  const LanguageKeyModel({required this.languageName,required this.languageKey});

  final String languageName;
  final String languageKey;

  factory LanguageKeyModel.fromJson(Map<String, dynamic> json) => LanguageKeyModel(
    languageKey: json['key'],
    languageName: json['name']
  );

  Map<String, dynamic> toJson() => {
    "name":languageName,
    "key":languageKey
  };

  @override
  List<Object?> get props =>[this.languageKey];
}