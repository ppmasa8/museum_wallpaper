import 'package:hive/hive.dart';

part 'metropolitanMuseum.g.dart';

@HiveType(typeId: 0)
class MetropolitanMuseum {
  MetropolitanMuseum({
    this.objectId,
    this.primaryImage,
    this.objectWikidataUrl,
  });

  int? objectId;
  @HiveField(0)
  String? primaryImage;
  @HiveField(1)
  String? objectWikidataUrl;

  factory MetropolitanMuseum.fromJson(Map<String, dynamic> json) => MetropolitanMuseum(
    objectId: json["objectID"],
    primaryImage: json["primaryImage"],
    objectWikidataUrl: json["objectWikidata_URL"],
  );

  Map<String, dynamic> toJson() => {
    "objectID": objectId,
    "primaryImage": primaryImage,
    "objectWikidata_URL": objectWikidataUrl,
  };
}