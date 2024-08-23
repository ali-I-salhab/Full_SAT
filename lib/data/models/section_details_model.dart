class SectionDetails{

  const SectionDetails({
    required this.sectionId,required this.sectionName,required this.sectionDescription,required this.sectionStatus,required this.createdAt
  });

  final String sectionId;
  final String sectionName;
  final String sectionDescription;
  final String sectionStatus;
  final String createdAt;

  factory SectionDetails.fromJson(Map<String,dynamic> json)=>SectionDetails(
      sectionId: json['id'],
      sectionName: json['name'],
      sectionDescription: json['desc'],
      sectionStatus: json['status'],
      createdAt: json['created_at']
  );
  Map<String, dynamic> toJson() => {
    "id": sectionId,
    "name": sectionName,
    "desc": sectionDescription,
    "status": sectionStatus,
    "created_at": createdAt
  };
}