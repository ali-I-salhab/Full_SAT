class ServiceCategory{

  const ServiceCategory({
    required this.serviceTitle,
    required this.serviceCategories
  });

  final String serviceTitle;
  final List<CategoryModel> serviceCategories;

  factory ServiceCategory.fromJson(Map<String,dynamic> json)=>ServiceCategory(
    serviceTitle: json['service'],
    serviceCategories: List<CategoryModel>.from(
        json['forms'].map((x) => CategoryModel.fromJson(x))) ?? [],

  );
  Map<String, dynamic> toJson() => {
    "service": serviceTitle,
    "forms":List<CategoryModel>.from(serviceCategories.map((e) => e.toJson()))

};
}


class CategoryModel{

  const CategoryModel({
    required this.catId,
    required this.catTitle,
    required this.catDescription,
    required this.catLogo,
    required this.updatedAt,
  });

  final int catId;
  final String catTitle;
  final String catDescription;
  final String catLogo;
  final String updatedAt;

  factory CategoryModel.fromJson(Map<String,dynamic> json)=>CategoryModel(
    catId: json['id'],
    catTitle: json['title'],
    catDescription: json['desc'],
    catLogo: json['icon'],
    updatedAt: json['updated_at']

  );
  Map<String, dynamic> toJson() => {
    "id": catId,
    "title": catTitle,
    "desc": catDescription,
    "icon": catLogo,
    "updated_at":updatedAt
  };
}