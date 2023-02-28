class WorkStatus {
  String? canteen;
  String? workingStatus;
  String? name;

  WorkStatus({this.canteen, this.workingStatus, this.name});

  WorkStatus.fromJson(Map<String, dynamic> json) {
    canteen = json['canteen'];
    workingStatus = json['working_status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['canteen'] = canteen;
    data['working_status'] = workingStatus;
    data['name'] = name;
    return data;
  }
}
