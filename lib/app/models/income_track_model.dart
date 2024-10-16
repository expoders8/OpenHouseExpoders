class GetAllTrackPropertyIncomeModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllTrackPropertyIncomeDataModel>? data;

  GetAllTrackPropertyIncomeModel(
      {this.success, this.code, this.message, this.data});

  GetAllTrackPropertyIncomeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllTrackPropertyIncomeDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllTrackPropertyIncomeDataModel.fromJson(v));
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

class GetAllTrackPropertyIncomeDataModel {
  String? propertyName;
  String? propertyAddress;
  String? propertyDescription;
  int? totalAmount;
  String? propertyImage;
  List<TotalExpenses>? totalExpenses;
  List<Pending>? pending;

  GetAllTrackPropertyIncomeDataModel(
      {this.propertyName,
      this.propertyAddress,
      this.propertyDescription,
      this.totalAmount,
      this.propertyImage,
      this.totalExpenses,
      this.pending});

  GetAllTrackPropertyIncomeDataModel.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
    propertyDescription = json['property_description'];
    totalAmount = json['total_amount'];
    propertyImage = json['property_image'];
    if (json['total_expenses'] != null) {
      totalExpenses = <TotalExpenses>[];
      json['total_expenses'].forEach((v) {
        totalExpenses!.add(TotalExpenses.fromJson(v));
      });
    }
    if (json['pending'] != null) {
      pending = <Pending>[];
      json['pending'].forEach((v) {
        pending!.add(Pending.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    data['property_description'] = propertyDescription;
    data['total_amount'] = totalAmount;
    data['property_image'] = propertyImage;
    if (totalExpenses != null) {
      data['total_expenses'] = totalExpenses!.map((v) => v.toJson()).toList();
    }
    if (pending != null) {
      data['pending'] = pending!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TotalExpenses {
  String? propertyExpense;

  TotalExpenses({this.propertyExpense});

  TotalExpenses.fromJson(Map<String, dynamic> json) {
    propertyExpense = json['property_expense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_expense'] = propertyExpense;
    return data;
  }
}

class Pending {
  String? pendingAmount;

  Pending({this.pendingAmount});

  Pending.fromJson(Map<String, dynamic> json) {
    pendingAmount = json['pending_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pending_amount'] = pendingAmount;
    return data;
  }
}
