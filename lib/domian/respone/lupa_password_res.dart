class ResponeLupaPassword {
  bool? error;
  String? msg;

  ResponeLupaPassword({this.error, this.msg});

  ResponeLupaPassword.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['msg'] = msg;
    return data;
  }
}
