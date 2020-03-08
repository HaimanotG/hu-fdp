class Student {
  String sn;
  String fullName;
  String sex;
  String admsionNo;
  String field;
  String campus;
  String building;
  String dorm;
  String year;

  Student(this.sn, this.fullName, this.sex, this.admsionNo, this.field,
      this.campus, this.building, this.dorm, this.year);
      
  Student.fromJson(Map<String, dynamic> json) {
    sn = json['S/N'];
    fullName = json['Fullname'];
    sex = json['Sex'];
    admsionNo = json['Admsion N'];
    field = json['Field'];
    campus = json['Campus'];
    building = json['Building'];
    dorm = json['Dorm'];
    year = json['Year'];
  }
}
