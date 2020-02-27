
//Class yang hanya menampung action response
class ActionModel {
  int status;
  String message;
  //String data;

  ActionModel({this.status, this.message, 
 // this.data
  });
  factory ActionModel.fromJson(Map<String, dynamic> json) {
    return ActionModel(
      status: json['status'] != null ? int.parse(json['status'].toString()) : 400,
      message: json['message'] != null ? json['message'] : "Terdapat kesalahan"
     // ,data: json['data'] != null ? json['data']: "data kosong"
    );
  }
}