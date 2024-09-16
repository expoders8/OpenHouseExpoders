class GetAllTenantModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllTenantDataModel>? data;

  GetAllTenantModel({this.success, this.code, this.message, this.data});

  GetAllTenantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllTenantDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllTenantDataModel.fromJson(v));
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

class GetAllTenantDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? passwordHash;
  String? googleToken;
  String? profilePicture;
  String? type;
  String? rating;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? resetToken;
  String? resetTokenExpires;

  GetAllTenantDataModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.passwordHash,
      this.googleToken,
      this.profilePicture,
      this.type,
      this.rating,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.resetToken,
      this.resetTokenExpires});

  GetAllTenantDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    passwordHash = json['password_hash'];
    googleToken = json['google_token'];
    profilePicture = json['profile_picture'];
    type = json['type'];
    rating = json['rating'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    resetToken = json['reset_token'];
    resetTokenExpires = json['reset_token_expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['password_hash'] = passwordHash;
    data['google_token'] = googleToken;
    data['profile_picture'] = profilePicture;
    data['type'] = type;
    data['rating'] = rating;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['reset_token'] = resetToken;
    data['reset_token_expires'] = resetTokenExpires;
    return data;
  }
}
