class MyCanteen {
  String? canteen;
  String? canteenName;
  String? categoryCanteen;
  String? openHours;
  String? closeHours;
  String? phoneNumber;
  String? address;
  String? workingStatus;
  String? logo;
  String? bgCover;

  MyCanteen(
      {this.canteen,
      this.canteenName,
      this.categoryCanteen,
      this.openHours,
      this.closeHours,
      this.phoneNumber,
      this.address,
      this.workingStatus,
      this.logo,
      this.bgCover});

  MyCanteen.fromJson(Map<String, dynamic> json) {
    canteen = json['canteen'];
    canteenName = json['canteen_name'];
    categoryCanteen = json['category_canteen'];
    openHours = json['open_hours'];
    closeHours = json['close_hours'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    workingStatus = json['working_status'];
    logo = json['logo'];
    bgCover = json['bg_cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['canteen'] = canteen;
    data['canteen_name'] = canteenName;
    data['category_canteen'] = categoryCanteen;
    data['open_hours'] = openHours;
    data['close_hours'] = closeHours;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['working_status'] = workingStatus;
    data['logo'] = logo;
    data['bg_cover'] = bgCover;
    return data;
  }
}
