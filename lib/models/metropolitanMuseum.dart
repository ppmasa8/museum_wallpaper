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
    this.artistWikidataUrl,
    this.objectDate,
    this.objectBeginDate,
    this.objectEndDate,
  });

  int? objectId;
  String? accessionYear;
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
  String? artistWikidataUrl;
  String? objectDate;
  int? objectBeginDate;
  int? objectEndDate;

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