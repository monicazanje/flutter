class Employee {
  String? status;
  List<Data>? data;

  Employee(Map<String, dynamic> json) {
    status = json['status'];
    data = [];
    if (json['data'] != null) {
      json['data'].forEach((mapobj) {
        Data obj = Data(mapobj);
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
