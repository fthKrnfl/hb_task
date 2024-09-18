class ContentModel {
  String? wrapperType;
  String? kind;
  int? trackId;
  String? artistName;
  String? trackName;
  String? trackCensoredName;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  double? trackRentalPrice;
  double? collectionHdPrice;
  double? trackHdPrice;
  double? trackHdRentalPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;

  ContentModel(
      {this.wrapperType,
      this.kind,
      this.trackId,
      this.artistName,
      this.trackName,
      this.trackCensoredName,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.trackRentalPrice,
      this.collectionHdPrice,
      this.trackHdPrice,
      this.trackHdRentalPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.contentAdvisoryRating,
      this.shortDescription,
      this.longDescription,
      this.hasITunesExtras});

  ContentModel.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    trackName = json['trackName'];
    trackCensoredName = json['trackCensoredName'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    trackRentalPrice = json['trackRentalPrice'];
    collectionHdPrice = json['collectionHdPrice'];
    trackHdPrice = json['trackHdPrice'];
    trackHdRentalPrice = json['trackHdRentalPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    hasITunesExtras = json['hasITunesExtras'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wrapperType'] = this.wrapperType;
    data['kind'] = this.kind;
    data['trackId'] = this.trackId;
    data['artistName'] = this.artistName;
    data['trackName'] = this.trackName;
    data['trackCensoredName'] = this.trackCensoredName;
    data['trackViewUrl'] = this.trackViewUrl;
    data['previewUrl'] = this.previewUrl;
    data['artworkUrl30'] = this.artworkUrl30;
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl100'] = this.artworkUrl100;
    data['collectionPrice'] = this.collectionPrice;
    data['trackPrice'] = this.trackPrice;
    data['trackRentalPrice'] = this.trackRentalPrice;
    data['collectionHdPrice'] = this.collectionHdPrice;
    data['trackHdPrice'] = this.trackHdPrice;
    data['trackHdRentalPrice'] = this.trackHdRentalPrice;
    data['releaseDate'] = this.releaseDate;
    data['collectionExplicitness'] = this.collectionExplicitness;
    data['trackExplicitness'] = this.trackExplicitness;
    data['trackTimeMillis'] = this.trackTimeMillis;
    data['country'] = this.country;
    data['currency'] = this.currency;
    data['primaryGenreName'] = this.primaryGenreName;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    data['shortDescription'] = this.shortDescription;
    data['longDescription'] = this.longDescription;
    data['hasITunesExtras'] = this.hasITunesExtras;
    return data;
  }
}
