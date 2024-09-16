// class GetAllPaymentModel {
//   bool? success;
//   int? code;
//   String? message;
//   List<GetAllPaymentDataModel>? data;

//   GetAllPaymentModel({this.success, this.code, this.message, this.data});

//   GetAllPaymentModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <GetAllPaymentDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(GetAllPaymentDataModel.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['code'] = code;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class GetAllPaymentDataModel {
//   String? id;
//   String? name;
//   String? address;
//   String? mobileNo;
//   String? totalPayment;
//   String? dueDate;
//   bool? isActive;
//   String? createdOn;
//   String? updatedOn;
//   String? createdById;
//   String? updatedById;
//   String? userid;
//   String? propertyId;

//   GetAllPaymentDataModel(
//       {this.id,
//       this.name,
//       this.address,
//       this.mobileNo,
//       this.totalPayment,
//       this.dueDate,
//       this.isActive,
//       this.createdOn,
//       this.updatedOn,
//       this.createdById,
//       this.updatedById,
//       this.userid,
//       this.propertyId});

//   GetAllPaymentDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     address = json['address'];
//     mobileNo = json['mobile_no'];
//     totalPayment = json['total_payment'];
//     dueDate = json['due_date'];
//     isActive = json['is_active'];
//     createdOn = json['created_on'];
//     updatedOn = json['updated_on'];
//     createdById = json['created_by_id'];
//     updatedById = json['updated_by_id'];
//     userid = json['userid'];
//     propertyId = json['property_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['address'] = address;
//     data['mobile_no'] = mobileNo;
//     data['total_payment'] = totalPayment;
//     data['due_date'] = dueDate;
//     data['is_active'] = isActive;
//     data['created_on'] = createdOn;
//     data['updated_on'] = updatedOn;
//     data['created_by_id'] = createdById;
//     data['updated_by_id'] = updatedById;
//     data['userid'] = userid;
//     data['property_id'] = propertyId;
//     return data;
//   }
// }

class GetAllPaymentModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllPaymentDataModel>? data;

  GetAllPaymentModel({this.success, this.code, this.message, this.data});

  GetAllPaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllPaymentDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllPaymentDataModel.fromJson(v));
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

class GetAllPaymentDataModel {
  String? id;
  String? propertyId;
  String? name;
  String? address;
  String? mobileNo;
  String? totalPayment;
  String? dueDate;
  bool? isActive;
  String? createdOn;
  String? userId;
  String? profilePicture;

  GetAllPaymentDataModel(
      {this.id,
      this.propertyId,
      this.name,
      this.address,
      this.mobileNo,
      this.totalPayment,
      this.dueDate,
      this.isActive,
      this.createdOn,
      this.userId,
      this.profilePicture});

  GetAllPaymentDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    name = json['name'];
    address = json['address'];
    mobileNo = json['mobile_no'];
    totalPayment = json['total_payment'];
    dueDate = json['due_date'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    userId = json['user_id'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['name'] = name;
    data['address'] = address;
    data['mobile_no'] = mobileNo;
    data['total_payment'] = totalPayment;
    data['due_date'] = dueDate;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['user_id'] = userId;
    data['profile_picture'] = profilePicture;
    return data;
  }
}
