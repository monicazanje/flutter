class Employeedata {
  String? status;
  List<Data>? data;
  String? message;

  Employeedata(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = [];
    if (json['data'] != null) {
      json['data'].forEach((mapObject) {
        Data obj = Data(mapObject);
        data!.add(obj);
      });
    }
  }
}

class Data {
  int? empid;
  String? empName;
  String? profileimg;
  int? empAge;
  int? empsal;

  Data(Map<String, dynamic> json) {
    empid = json['id'];
    empName = json['employee_name'];
    empAge = json['employee_age'];
    empsal = json['employee_salary'];
    profileimg = json['profile_image'];
  }
}
