class TenantLendingModel {
  bool? success;
  int? code;
  String? message;
  TenantLendingDataModel? data;

  TenantLendingModel({this.success, this.code, this.message, this.data});

  TenantLendingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? TenantLendingDataModel.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TenantLendingDataModel {
  List<InvitationData>? invitationData;
  List<TenantRequest>? tenantRequest;
  PropertiesData? propertiesData;

  TenantLendingDataModel(
      {this.invitationData, this.tenantRequest, this.propertiesData});

  TenantLendingDataModel.fromJson(Map<String, dynamic> json) {
    if (json['invitationData'] != null) {
      invitationData = <InvitationData>[];
      json['invitationData'].forEach((v) {
        invitationData!.add(InvitationData.fromJson(v));
      });
    }
    if (json['tenantRequest'] != null) {
      tenantRequest = <TenantRequest>[];
      json['tenantRequest'].forEach((v) {
        tenantRequest!.add(TenantRequest.fromJson(v));
      });
    }
    propertiesData = json['propertiesData'] != null
        ? PropertiesData.fromJson(json['propertiesData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (invitationData != null) {
      data['invitationData'] = invitationData!.map((v) => v.toJson()).toList();
    }
    if (tenantRequest != null) {
      data['tenantRequest'] = tenantRequest!.map((v) => v.toJson()).toList();
    }
    if (propertiesData != null) {
      data['propertiesData'] = propertiesData!.toJson();
    }
    return data;
  }
}

class InvitationData {
  String? id;
  String? email;
  String? status;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? phoneNumber;
  String? hostUserId;
  String? propertyId;
  String? rentAmount;
  String? tenantId;
  String? startDate;
  String? endDate;
  String? firstName;
  String? lastName;
  String? address;

  InvitationData(
      {this.id,
      this.email,
      this.status,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.phoneNumber,
      this.hostUserId,
      this.propertyId,
      this.rentAmount,
      this.tenantId,
      this.startDate,
      this.endDate,
      this.firstName,
      this.lastName,
      this.address});

  InvitationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    status = json['status'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    phoneNumber = json['phone_number'];
    hostUserId = json['host_user_id'];
    propertyId = json['property_id'];
    rentAmount = json['rent_amount'];
    tenantId = json['tenant_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['status'] = status;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['phone_number'] = phoneNumber;
    data['host_user_id'] = hostUserId;
    data['property_id'] = propertyId;
    data['rent_amount'] = rentAmount;
    data['tenant_id'] = tenantId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    return data;
  }
}

class TenantRequest {
  String? id;
  String? status;
  String? hostUserId;
  String? propertyId;
  String? createdOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? startDate;
  String? tenantId;
  String? description;
  String? amenityId;
  String? type;
  String? title;
  String? address;
  String? username;

  TenantRequest(
      {this.id,
      this.status,
      this.hostUserId,
      this.propertyId,
      this.createdOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.startDate,
      this.tenantId,
      this.description,
      this.amenityId,
      this.type,
      this.title,
      this.address,
      this.username});

  TenantRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    hostUserId = json['host_user_id'];
    propertyId = json['property_id'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    startDate = json['start_date'];
    tenantId = json['tenant_id'];
    description = json['description'];
    amenityId = json['amenity_id'];
    type = json['type'];
    title = json['title'];
    address = json['address'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['host_user_id'] = hostUserId;
    data['property_id'] = propertyId;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['start_date'] = startDate;
    data['tenant_id'] = tenantId;
    data['description'] = description;
    data['amenity_id'] = amenityId;
    data['type'] = type;
    data['title'] = title;
    data['address'] = address;
    data['username'] = username;
    return data;
  }
}

class PropertiesData {
  String? id;
  String? propertyId;
  String? tenantUserId;
  int? rentAmount;
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
  String? address;
  String? name;
  String? person;
  String? rentAmountUnit;
  String? firstName;
  String? lastName;
  String? propertyImage;

  PropertiesData(
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
      this.address,
      this.name,
      this.person,
      this.rentAmountUnit,
      this.firstName,
      this.lastName,
      this.propertyImage});

  PropertiesData.fromJson(Map<String, dynamic> json) {
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
    address = json['address'];
    name = json['name'];
    person = json['person'];
    rentAmountUnit = json['rent_amount_unit'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    propertyImage = json['property_image'];
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
    data['address'] = address;
    data['name'] = name;
    data['person'] = person;
    data['rent_amount_unit'] = rentAmountUnit;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['property_image'] = propertyImage;
    return data;
  }
}
