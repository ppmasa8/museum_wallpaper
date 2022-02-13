import 'package:hive/hive.dart';

part 'metropolitanMuseum.g.dart';

@HiveType(typeId: 0)
class MetropolitanMuseum {
  MetropolitanMuseum({
    this.objectId,
    this.accessionYear,
    this.primaryImage,
    this.primaryImageSmall,
    this.department,
    this.objectName,
    this.title,
    this.culture,
    this.period,
    this.artistRole,
    this.artistDisplayName,
    this.artistDisplayBio,
    this.artistAlphaSort,
    this.artistNationality,
    this.artistBeginDate,
    this.artistEndDate,
    this.artistGender,
    this.objectDate,
    this.objectBeginDate,
    this.objectEndDate,
    this.objectWikidataUrl,
  });

  int? objectId;
  String? accessionYear;
  @HiveField(0)
  String? primaryImage;
  String? primaryImageSmall;
  String? department;
  String? objectName;
  String? title;
  String? culture;
  String? period;
  String? artistRole;
  String? artistDisplayName;
  String? artistDisplayBio;
  String? artistAlphaSort;
  String? artistNationality;
  String? artistBeginDate;
  String? artistEndDate;
  String? artistGender;
  String? objectDate;
  int? objectBeginDate;
  int? objectEndDate;
  @HiveField(1)
  String? objectWikidataUrl;

  factory MetropolitanMuseum.fromJson(Map<String, dynamic> json) => MetropolitanMuseum(
    objectId: json["objectID"],
    accessionYear: json["accessionYear"],
    primaryImage: json["primaryImage"],
    primaryImageSmall: json["primaryImageSmall"],
    department: json["department"],
    objectName: json["objectName"],
    title: json["title"],
    culture: json["culture"],
    period: json["period"],
    artistRole: json["artistRole"],
    artistDisplayName: json["artistDisplayName"],
    artistDisplayBio: json["artistDisplayBio"],
    artistAlphaSort: json["artistAlphaSort"],
    artistNationality: json["artistNationality"],
    artistBeginDate: json["artistBeginDate"],
    artistEndDate: json["artistEndDate"],
    artistGender: json["artistGender"],
    objectDate: json["objectDate"],
    objectBeginDate: json["objectBeginDate"],
    objectEndDate: json["objectEndDate"],
    objectWikidataUrl: json["objectWikidata_URL"],
  );

  Map<String, dynamic> toJson() => {
    "objectID": objectId,
    "accessionYear": accessionYear,
    "primaryImage": primaryImage,
    "primaryImageSmall": primaryImageSmall,
    "department": department,
    "objectName": objectName,
    "title": title,
    "culture": culture,
    "period": period,
    "artistRole": artistRole,
    "artistDisplayName": artistDisplayName,
    "artistDisplayBio": artistDisplayBio,
    "artistAlphaSort": artistAlphaSort,
    "artistNationality": artistNationality,
    "artistBeginDate": artistBeginDate,
    "artistEndDate": artistEndDate,
    "artistGender": artistGender,
    "objectDate": objectDate,
    "objectBeginDate": objectBeginDate,
    "objectEndDate": objectEndDate,
    "objectWikidata_URL": objectWikidataUrl,
  };
}