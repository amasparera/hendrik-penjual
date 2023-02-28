class Menu {
  String? id;
  String? name;
  String? price;
  String? code;
  String? categoryMenu;
  String? statusMenu;
  String? menuPhoto;

  Menu(
      {this.id,
      this.name,
      this.price,
      this.code,
      this.categoryMenu,
      this.statusMenu,
      this.menuPhoto});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    code = json['code'];
    categoryMenu = json['category_menu'];
    statusMenu = json['status_menu'];
    menuPhoto = json['menu_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['code'] = code;
    data['category_menu'] = categoryMenu;
    data['status_menu'] = statusMenu;
    data['menu_photo'] = menuPhoto;
    return data;
  }
}
