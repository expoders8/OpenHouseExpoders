// class GetAllCheckoutModel {
//   bool? success;
//   int? code;
//   String? message;
//   List<GetAllCheckoutDataModel>? data;

//   GetAllCheckoutModel({this.success, this.code, this.message, this.data});

//   GetAllCheckoutModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <GetAllCheckoutDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(GetAllCheckoutDataModel.fromJson(v));
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

// class GetAllCheckoutDataModel {
//   String? id;
//   String? propertyId;
//   String? tenantUserId;
//   String? rentAmount;
//   String? startDate;
//   String? endDate;
//   String? status;
//   String? cretedOn;
//   String? updatedOn;
//   String? createdById;
//   String? updatedById;
//   bool? isActive;
//   String? hostUserId;
//   bool? checkoutRequested;
//   List? checkoutChecklist;
//   String? checkoutRequestedOn;
//   String? username;
//   String? phonenumber;
//   String? address;
//   String? profilePicture;

//   GetAllCheckoutDataModel(
//       {this.id,
//       this.propertyId,
//       this.tenantUserId,
//       this.rentAmount,
//       this.startDate,
//       this.endDate,
//       this.status,
//       this.cretedOn,
//       this.updatedOn,
//       this.createdById,
//       this.updatedById,
//       this.isActive,
//       this.hostUserId,
//       this.checkoutRequested,
//       this.checkoutChecklist,
//       this.checkoutRequestedOn,
//       this.username,
//       this.phonenumber,
//       this.address,
//       this.profilePicture});

//   GetAllCheckoutDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     propertyId = json['property_id'];
//     tenantUserId = json['tenant_user_id'];
//     rentAmount = json['rent_amount'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     status = json['status'];
//     cretedOn = json['creted_on'];
//     updatedOn = json['updated_on'];
//     createdById = json['created_by_id'];
//     updatedById = json['updated_by_id'];
//     isActive = json['is_active'];
//     hostUserId = json['host_user_id'];
//     checkoutRequested = json['checkout_requested'];
//     checkoutChecklist = json['checkout_checklist'];
//     checkoutRequestedOn = json['checkout_requested_on'];
//     username = json['username'];
//     phonenumber = json['phone_number'];
//     profilePicture = json['profile_picture'];
//     address = json['address'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['property_id'] = propertyId;
//     data['tenant_user_id'] = tenantUserId;
//     data['rent_amount'] = rentAmount;
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['status'] = status;
//     data['creted_on'] = cretedOn;
//     data['updated_on'] = updatedOn;
//     data['created_by_id'] = createdById;
//     data['updated_by_id'] = updatedById;
//     data['is_active'] = isActive;
//     data['host_user_id'] = hostUserId;
//     data['checkout_requested'] = checkoutRequested;
//     data['checkout_checklist'] = checkoutChecklist;
//     data['checkout_requested_on'] = checkoutRequestedOn;
//     data['username'] = username;
//     data['phone_number'] = phonenumber;
//     data['profile_picture'] = profilePicture;
//     data['address'] = address;
//     return data;
//   }
// }

// class GetAllCheckoutModel {
//   bool? success;
//   int? code;
//   String? message;
//   List<GetAllCheckoutDataModel>? data;

//   GetAllCheckoutModel({this.success, this.code, this.message, this.data});

//   GetAllCheckoutModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <GetAllCheckoutDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(GetAllCheckoutDataModel.fromJson(v));
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

// class GetAllCheckoutDataModel {
//   String? id;
//   String? propertyId;
//   String? tenantUserId;
//   String? rentAmount;
//   String? startDate;
//   String? endDate;
//   String? status;
//   String? cretedOn;
//   String? updatedOn;
//   String? createdById;
//   String? updatedById;
//   bool? isActive;
//   String? hostUserId;
//   bool? checkoutRequested;
//   List<CheckoutChecklist>? checkoutChecklist;
//   String? checkoutRequestedOn;
//   String? username;
//   String? profilePicture;
//   String? phoneNumber;
//   String? email;
//   String? name;
//   String? address;

//   GetAllCheckoutDataModel(
//       {this.id,
//       this.propertyId,
//       this.tenantUserId,
//       this.rentAmount,
//       this.startDate,
//       this.endDate,
//       this.status,
//       this.cretedOn,
//       this.updatedOn,
//       this.createdById,
//       this.updatedById,
//       this.isActive,
//       this.hostUserId,
//       this.checkoutRequested,
//       this.checkoutChecklist,
//       this.checkoutRequestedOn,
//       this.username,
//       this.profilePicture,
//       this.phoneNumber,
//       this.email,
//       this.name,
//       this.address});

//   GetAllCheckoutDataModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     propertyId = json['property_id'];
//     tenantUserId = json['tenant_user_id'];
//     rentAmount = json['rent_amount'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     status = json['status'];
//     cretedOn = json['creted_on'];
//     updatedOn = json['updated_on'];
//     createdById = json['created_by_id'];
//     updatedById = json['updated_by_id'];
//     isActive = json['is_active'];
//     hostUserId = json['host_user_id'];
//     checkoutRequested = json['checkout_requested'];
//     if (json['checkout_checklist'] != null) {
//       checkoutChecklist = <CheckoutChecklist>[];
//       json['checkout_checklist'].forEach((v) {
//         checkoutChecklist!.add(CheckoutChecklist.fromJson(v));
//       });
//     }
//     checkoutRequestedOn = json['checkout_requested_on'];
//     username = json['username'];
//     profilePicture = json['profile_picture'];
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     name = json['name'];
//     address = json['address'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['property_id'] = propertyId;
//     data['tenant_user_id'] = tenantUserId;
//     data['rent_amount'] = rentAmount;
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['status'] = status;
//     data['creted_on'] = cretedOn;
//     data['updated_on'] = updatedOn;
//     data['created_by_id'] = createdById;
//     data['updated_by_id'] = updatedById;
//     data['is_active'] = isActive;
//     data['host_user_id'] = hostUserId;
//     data['checkout_requested'] = checkoutRequested;
//     if (checkoutChecklist != null) {
//       data['checkout_checklist'] =
//           checkoutChecklist!.map((v) => v.toJson()).toList();
//     }
//     data['checkout_requested_on'] = checkoutRequestedOn;
//     data['username'] = username;
//     data['profile_picture'] = profilePicture;
//     data['phone_number'] = phoneNumber;
//     data['email'] = email;
//     data['name'] = name;
//     data['address'] = address;
//     return data;
//   }
// }

// class CheckoutChecklist {
//   bool? removePersonalBelongings;
//   bool? checkForDamages;
//   bool? returnKeys;
//   bool? swimmingPool;
//   bool? payOutstandingBills;
//   bool? cleanRoom;
//   bool? electricity;

//   CheckoutChecklist(
//       {this.removePersonalBelongings,
//       this.checkForDamages,
//       this.returnKeys,
//       this.swimmingPool,
//       this.payOutstandingBills,
//       this.cleanRoom,
//       this.electricity});

//   CheckoutChecklist.fromJson(Map<String, dynamic> json) {
//     removePersonalBelongings = json['Remove Personal Belongings'];
//     checkForDamages = json['Check for Damages'];
//     returnKeys = json['Return Keys'];
//     swimmingPool = json['Swimming Pool'];
//     payOutstandingBills = json['Pay Outstanding Bills'];
//     cleanRoom = json['Clean Room'];
//     electricity = json['Electricity'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Remove Personal Belongings'] = removePersonalBelongings;
//     data['Check for Damages'] = checkForDamages;
//     data['Return Keys'] = returnKeys;
//     data['Swimming Pool'] = swimmingPool;
//     data['Pay Outstanding Bills'] = payOutstandingBills;
//     data['Clean Room'] = cleanRoom;
//     data['Electricity'] = electricity;
//     return data;
//   }
// }

class GetAllCheckoutModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllCheckoutDataModel>? data;

  GetAllCheckoutModel({this.success, this.code, this.message, this.data});

  GetAllCheckoutModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllCheckoutDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllCheckoutDataModel.fromJson(v));
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

class GetAllCheckoutDataModel {
  String? id;
  String? propertyId;
  String? tenantUserId;
  String? rentAmount;
  String? status;
  String? cretedOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? hostUserId;
  bool? checkoutRequested;
  String? checkoutRequestedOn;
  String? startDate;
  String? endDate;
  String? username;
  String? profilePicture;
  String? phoneNumber;
  String? email;
  String? name;
  String? address;
  List<UpdatedChecklist>? updatedChecklist;

  GetAllCheckoutDataModel(
      {this.id,
      this.propertyId,
      this.tenantUserId,
      this.rentAmount,
      this.status,
      this.cretedOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.hostUserId,
      this.checkoutRequested,
      this.checkoutRequestedOn,
      this.startDate,
      this.endDate,
      this.username,
      this.profilePicture,
      this.phoneNumber,
      this.email,
      this.name,
      this.address,
      this.updatedChecklist});

  GetAllCheckoutDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    tenantUserId = json['tenant_user_id'];
    rentAmount = json['rent_amount'];
    status = json['status'];
    cretedOn = json['creted_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    hostUserId = json['host_user_id'];
    checkoutRequested = json['checkout_requested'];
    checkoutRequestedOn = json['checkout_requested_on'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    name = json['name'];
    address = json['address'];
    if (json['updatedChecklist'] != null) {
      updatedChecklist = <UpdatedChecklist>[];
      json['updatedChecklist'].forEach((v) {
        updatedChecklist!.add(UpdatedChecklist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_id'] = propertyId;
    data['tenant_user_id'] = tenantUserId;
    data['rent_amount'] = rentAmount;
    data['status'] = status;
    data['creted_on'] = cretedOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['host_user_id'] = hostUserId;
    data['checkout_requested'] = checkoutRequested;
    data['checkout_requested_on'] = checkoutRequestedOn;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['username'] = username;
    data['profile_picture'] = profilePicture;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['name'] = name;
    data['address'] = address;
    if (updatedChecklist != null) {
      data['updatedChecklist'] =
          updatedChecklist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdatedChecklist {
  String? name;
  dynamic isActive;

  UpdatedChecklist({this.name, this.isActive});

  UpdatedChecklist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['name'] == "Comment") {
      isActive = json['isActive'].toString();
    } else {
      isActive = json['isActive'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isActive'] = isActive;
    return data;
  }
}
