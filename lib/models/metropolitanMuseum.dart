import 'dart:convert';

MetropolitanMuseum metropolitanMuseumFromJson(String str) => MetropolitanMuseum.fromJson(json.decode(str));

String metropolitanMuseumToJson(MetropolitanMuseum data) => json.encode(data.toJson());

class MetropolitanMuseum {
  MetropolitanMuseum({
    required this.objectId,
    required this.accessionYear,
    required this.primaryImage,
    required this.primaryImageSmall,
    required this.additionalImages,
    required this.department,
    required this.objectName,
    required this.title,
    required this.culture,
    required this.period,
    required this.artistRole,
    required this.artistDisplayName,
    required this.artistDisplayBio,
    required this.artistAlphaSort,
    required this.artistNationality,
    required this.artistBeginDate,
    required this.artistEndDate,
    required this.artistGender,
    required this.artistWikidataUrl,
    required this.objectDate,
    required this.objectBeginDate,
    required this.objectEndDate,
  });

  int objectId;
  String accessionYear;
  String primaryImage;
  String primaryImageSmall;
  List<String> additionalImages;
  String department;
  String objectName;
  String title;
  String culture;
  String period;
  String artistRole;
  String artistDisplayName;
  String artistDisplayBio;
  String artistAlphaSort;
  String artistNationality;
  String artistBeginDate;
  String artistEndDate;
  String artistGender;
  String artistWikidataUrl;
  String objectDate;
  int objectBeginDate;
  int objectEndDate;

  factory MetropolitanMuseum.fromJson(Map<String, dynamic> json) => MetropolitanMuseum(
    objectId: json["objectID"],
    accessionYear: json["accessionYear"],
    primaryImage: json["primaryImage"],
    primaryImageSmall: json["primaryImageSmall"],
    additionalImages: List<String>.from(json["additionalImages"].map((x) => x)),
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
    artistWikidataUrl: json["artistWikidata_URL"],
    objectDate: json["objectDate"],
    objectBeginDate: json["objectBeginDate"],
    objectEndDate: json["objectEndDate"],
  );

  Map<String, dynamic> toJson() => {
    "objectID": objectId,
    "accessionYear": accessionYear,
    "primaryImage": primaryImage,
    "primaryImageSmall": primaryImageSmall,
    "additionalImages": List<dynamic>.from(additionalImages.map((x) => x)),
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
    "artistWikidata_URL": artistWikidataUrl,
    "objectDate": objectDate,
    "objectBeginDate": objectBeginDate,
    "objectEndDate": objectEndDate,
  };
}