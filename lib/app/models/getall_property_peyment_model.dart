class GetAllProeprtyPaymentModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllProeprtyPaymentDataModel>? data;

  GetAllProeprtyPaymentModel(
      {this.success, this.code, this.message, this.data});

  GetAllProeprtyPaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllProeprtyPaymentDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllProeprtyPaymentDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllProeprtyPaymentDataModel {
  String? paymentAmount;
  String? paymentDate;
  String? username;

  GetAllProeprtyPaymentDataModel(
      {this.paymentAmount, this.paymentDate, this.username});

  GetAllProeprtyPaymentDataModel.fromJson(Map<String, dynamic> json) {
    paymentAmount = json['payment_amount'];
    paymentDate = json['payment_date'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_amount'] = paymentAmount;
    data['payment_date'] = paymentDate;
    data['username'] = username;
    return data;
  }
}
