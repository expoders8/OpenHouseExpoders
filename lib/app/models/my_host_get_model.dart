class GetAllMyHostsModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllMyHostsDataModel>? data;

  GetAllMyHostsModel({this.success, this.code, this.message, this.data});

  GetAllMyHostsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllMyHostsDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllMyHostsDataModel.fromJson(v));
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

class GetAllMyHostsDataModel {
  String? id;
  String? tenantFirstName;
  String? tenantLastName;
  String? tenantEmail;
  String? tenantPhoneNumber;
  String? tenantProfilePicture;
  String? tenantType;
  String? address;

  GetAllMyHostsDataModel(
      {this.id,
      this.tenantFirstName,
      this.tenantLastName,
      this.tenantEmail,
      this.tenantPhoneNumber,
      this.tenantProfilePicture,
      this.tenantType,
      this.address});

  GetAllMyHostsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantFirstName = json['host_first_name'];
    tenantLastName = json['host_last_name'];
    tenantEmail = json['host_email'];
    tenantPhoneNumber = json['host_phone_number'];
    tenantProfilePicture = json['host_profile_picture'];
    tenantType = json['host_type'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['host_first_name'] = tenantFirstName;
    data['host_last_name'] = tenantLastName;
    data['host_email'] = tenantEmail;
    data['host_phone_number'] = tenantPhoneNumber;
    data['host_profile_picture'] = tenantProfilePicture;
    data['host_type'] = tenantType;
    data['address'] = address;
    return data;
  }
}

// class GetAllMyTenantDetailModel {
//   bool? success;
//   int? code;
//   String? message;
//   GetAllMyTenantDetailDataModel? data;

//   GetAllMyTenantDetailModel({this.success, this.code, this.message, this.data});

//   GetAllMyTenantDetailModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     data = json['data'] != null
//         ? GetAllMyTenantDetailDataModel.fromJson(json['data'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['code'] = code;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class GetAllMyTenantDetailDataModel {
//   Tenant? tenant;

//   GetAllMyTenantDetailDataModel({this.tenant});

//   GetAllMyTenantDetailDataModel.fromJson(Map<String, dynamic> json) {
//     tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (tenant != null) {
//       data['tenant'] = tenant!.toJson();
//     }
//     return data;
//   }
// }

// class Tenant {
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phoneNumber;
//   String? profilePicture;
//   String? type;
//   Property? property;

//   Tenant(
//       {this.id,
//       this.firstName,
//       this.lastName,
//       this.email,
//       this.phoneNumber,
//       this.profilePicture,
//       this.type,
//       this.property});

//   Tenant.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['firstName'];
//     lastName = json['lastName'];
//     email = json['email'];
//     phoneNumber = json['phoneNumber'];
//     profilePicture = json['profilePicture'];
//     type = json['type'];
//     property =
//         json['property'] != null ? Property.fromJson(json['property']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['firstName'] = firstName;
//     data['lastName'] = lastName;
//     data['email'] = email;
//     data['phoneNumber'] = phoneNumber;
//     data['profilePicture'] = profilePicture;
//     data['type'] = type;
//     if (property != null) {
//       data['property'] = property!.toJson();
//     }
//     return data;
//   }
// }

// class Property {
//   String? id;
//   String? name;
//   String? address;
//   String? description;
//   int? rentAmount;
//   String? profilePicture;
//   String? createdAt;
//   String? startDate;
//   String? endDate;

//   Property(
//       {this.id,
//       this.name,
//       this.address,
//       this.description,
//       this.rentAmount,
//       this.profilePicture,
//       this.createdAt,
//       this.startDate,
//       this.endDate});

//   Property.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     address = json['address'];
//     description = json['description'];
//     rentAmount = json['rent_amount'];
//     profilePicture = json['profilePicture'];
//     createdAt = json['createdAt'];
//     startDate = json['startDate'];
//     endDate = json['endDate'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['address'] = address;
//     data['description'] = description;
//     data['rent_amount'] = rentAmount;
//     data['profilePicture'] = profilePicture;
//     data['createdAt'] = createdAt;
//     data['startDate'] = startDate;
//     data['endDate'] = endDate;
//     return data;
//   }
// }
