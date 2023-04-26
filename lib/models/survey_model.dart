// 
class SurveyModel {
  int? id;
  String? question;
  String? optionA;
  String? optionB;
  String? optionC;
  String? optionD;
  String? surveyType;
  String? createdAt;
  String? updatedAt;
  int? totalcount;
  int? optiona;
  int? optionb;
  int? optionc;
  int? optiond;
  List<Surveyresult>? surveyresult;

  SurveyModel(
      {this.id,
      this.question,
      this.optiona,
      this.optionb,
      this.optionc,
      this.optiond,
      this.surveyType,
      this.createdAt,
      this.updatedAt,
      this.totalcount,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.surveyresult});

  SurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    optionD = json['option_d'];
    surveyType = json['survey_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalcount = json['totalcount'];
    optiona = json['optionA'];
    optionb = json['optionB'];
    optionc = json['optionC'];
    optiond = json['optionD'];
    if (json['surveyresult'] != null) {
      surveyresult = <Surveyresult>[];
      json['surveyresult'].forEach((v) {
        surveyresult!.add(new Surveyresult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option_a'] = this.optionA;
    data['option_b'] = this.optionB;
    data['option_c'] = this.optionC;
    data['option_d'] = this.optionD;
    data['survey_type'] = this.surveyType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['totalcount'] = this.totalcount;
    data['optionA'] = this.optionA;
    data['optionB'] = this.optionB;
    data['optionC'] = this.optionC;
    data['optionD'] = this.optionD;
    if (this.surveyresult != null) {
      data['surveyresult'] = this.surveyresult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surveyresult {
  int? id;
  int? surveyId;
  int? userId;
  String? option;
  String? createdAt;
  String? updatedAt;

  Surveyresult(
      {this.id,
      this.surveyId,
      this.userId,
      this.option,
      this.createdAt,
      this.updatedAt});

  Surveyresult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surveyId = json['survey_id'];
    userId = json['user_id'];
    option = json['option'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['survey_id'] = this.surveyId;
    data['user_id'] = this.userId;
    data['option'] = this.option;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}