class PartnerModel {
  final String id;
  final String name;
  final String profilePic;

  PartnerModel({
    required this.id,
    required this.name,
    required this.profilePic,
  });

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
    id: json['id'] as String,
    name: json['name'] as String,
    profilePic: json['profilePic'] as String,
  );
}
