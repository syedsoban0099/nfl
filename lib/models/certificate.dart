class Certificate {
  int? id;
  String? certImg;
  String? backgroundImg;
  String? plateImg;
  String? backgroundImgDigital;
  String? icon1;
  String? icon2;
  String? icon3;
  int? leagueId;
  int? teamId;
  String? seasonId;
  int? heroId;
  int? momentsId;
  String? type;
  String? price;
  String? qrCode;
  String? createdAt;
  String? updatedAt;

  Certificate(
      {this.id,
      this.certImg,
      this.backgroundImg,
      this.plateImg,
      this.backgroundImgDigital,
      this.icon1,
      this.icon2,
      this.icon3,
      this.leagueId,
      this.teamId,
      this.seasonId,
      this.heroId,
      this.momentsId,
      this.type,
      this.price,
      this.qrCode,
      this.createdAt,
      this.updatedAt});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    certImg = json['cert_img'];
    backgroundImg = json['background_img'];
    plateImg = json['plate_img'];
    backgroundImgDigital = json['background_img_digital'];
    icon1 = json['icon1'];
    icon2 = json['icon2'];
    icon3 = json['icon3'];
    leagueId = json['league_id'];
    teamId = json['team_id'];
    seasonId = json['season_id'];
    heroId = json['hero_id'];
    momentsId = json['moments_id'];
    type = json['type'];
    price = json['price'];
    qrCode = json['qr_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cert_img'] = this.certImg;
    data['background_img'] = this.backgroundImg;
    data['plate_img'] = this.plateImg;
    data['background_img_digital'] = this.backgroundImgDigital;
    data['icon1'] = this.icon1;
    data['icon2'] = this.icon2;
    data['icon3'] = this.icon3;
    data['league_id'] = this.leagueId;
    data['team_id'] = this.teamId;
    data['season_id'] = this.seasonId;
    data['hero_id'] = this.heroId;
    data['moments_id'] = this.momentsId;
    data['type'] = this.type;
    data['price'] = this.price;
    data['qr_code'] = this.qrCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}