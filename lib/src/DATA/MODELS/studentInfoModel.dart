class StudentInfoModel {
  String? authCheck;
  String? schoolname;
  String? schoolAddress;
  String? sessionId;
  String? sessionStr;
  String? studentId;
  String? admNo;
  String? stName;
  String? fatherName;
  String? gender;
  String? dOB;
  String? compClass;
  String? classId;
  String? streamId;
  String? yearId;
  String? mobile;
  String? classSectionId;
  String? retMessage;
  String? attStatus;
  String? imageUrl;
  String? showFeeReceipt;

  StudentInfoModel(
      {this.authCheck,
      this.schoolname,
      this.schoolAddress,
      this.sessionId,
      this.sessionStr,
      this.studentId,
      this.admNo,
      this.stName,
      this.fatherName,
      this.gender,
      this.dOB,
      this.compClass,
      this.classId,
      this.streamId,
      this.yearId,
      this.mobile,
      this.classSectionId,
      this.retMessage,
      this.attStatus,
      this.imageUrl,
      this.showFeeReceipt});

  StudentInfoModel.fromJson(Map<String, dynamic> json) {
    authCheck = json['AuthCheck'];
    schoolname = json['Schoolname'];
    schoolAddress = json['SchoolAddress'];
    sessionId = json['SessionId'];
    sessionStr = json['SessionStr'];
    studentId = json['StudentId'];
    admNo = json['AdmNo'];
    stName = json['StName'];
    fatherName = json['FatherName'];
    gender = json['Gender'];
    dOB = json['DOB'];
    compClass = json['CompClass'];
    classId = json['ClassId'];
    streamId = json['StreamId'];
    yearId = json['YearId'];
    mobile = json['Mobile'];
    classSectionId = json['ClassSectionId'];
    retMessage = json['RetMessage'];
    attStatus = json['AttStatus'];
    imageUrl = json['imageUrl'];
    showFeeReceipt = json['showFeeReceipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AuthCheck'] = this.authCheck;
    data['Schoolname'] = this.schoolname;
    data['SchoolAddress'] = this.schoolAddress;
    data['SessionId'] = this.sessionId;
    data['SessionStr'] = this.sessionStr;
    data['StudentId'] = this.studentId;
    data['AdmNo'] = this.admNo;
    data['StName'] = this.stName;
    data['FatherName'] = this.fatherName;
    data['Gender'] = this.gender;
    data['DOB'] = this.dOB;
    data['CompClass'] = this.compClass;
    data['ClassId'] = this.classId;
    data['StreamId'] = this.streamId;
    data['YearId'] = this.yearId;
    data['Mobile'] = this.mobile;
    data['ClassSectionId'] = this.classSectionId;
    data['RetMessage'] = this.retMessage;
    data['AttStatus'] = this.attStatus;
    data['imageUrl'] = this.imageUrl;
    data['showFeeReceipt'] = this.showFeeReceipt;
    return data;
  }
}
