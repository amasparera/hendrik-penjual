class RecapMenu {
  String? code;
  String? menu;
  String? sold;
  String? total;

  RecapMenu({this.code, this.menu, this.sold, this.total});

  RecapMenu.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    menu = json['menu'];
    sold = json['sold'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['menu'] = menu;
    data['sold'] = sold;
    data['total'] = total;
    return data;
  }
}
