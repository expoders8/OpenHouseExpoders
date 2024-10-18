class HostLendingModel {
  bool? success;
  int? code;
  String? message;
  HostLendingDataModel? data;

  HostLendingModel({this.success, this.code, this.message, this.data});

  HostLendingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? HostLendingDataModel.fromJson(json['data'])
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

class HostLendingDataModel {
  List<CheckOutRequest>? checkOutRequest;
  List<TenantRequest>? tenantRequest;
  PropertiesData? propertiesData;

  HostLendingDataModel(
      {this.checkOutRequest, this.tenantRequest, this.propertiesData});

  HostLendingDataModel.fromJson(Map<String, dynamic> json) {
    if (json['checkOutRequest'] != null) {
      checkOutRequest = <CheckOutRequest>[];
      json['checkOutRequest'].forEach((v) {
        checkOutRequest!.add(CheckOutRequest.fromJson(v));
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
    if (checkOutRequest != null) {
      data['checkOutRequest'] =
          checkOutRequest!.map((v) => v.toJson()).toList();
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

class CheckOutRequest {
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

  CheckOutRequest(
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

  CheckOutRequest.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? address;
  String? title;

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
      this.username,
      this.address,
      this.title});

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
    username = json['username'];
    address = json['address'];
    title = json['title'];
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
    data['username'] = username;
    data['address'] = address;
    data['title'] = title;
    return data;
  }
}

class PropertiesData {
  String? id;
  String? name;
  String? description;
  int? rentAmount;
  String? facilities;
  String? person;
  String? address;
  String? countryId;
  String? stateId;
  String? cityName;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? createdOn;
  String? updatedOn;
  String? healthPercentage;
  String? address1;
  String? status;
  String? category;
  String? type;
  String? subtype;
  String? size;
  String? sizeunit;
  String? rentAmountUnit;
  String? hostUserId;
  String? propertyImage;

  PropertiesData(
      {this.id,
      this.name,
      this.description,
      this.rentAmount,
      this.facilities,
      this.person,
      this.address,
      this.countryId,
      this.stateId,
      this.cityName,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.createdOn,
      this.updatedOn,
      this.healthPercentage,
      this.address1,
      this.status,
      this.category,
      this.type,
      this.subtype,
      this.size,
      this.sizeunit,
      this.rentAmountUnit,
      this.hostUserId,
      this.propertyImage});

  PropertiesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    rentAmount = json['rent_amount'];
    facilities = json['facilities'];
    person = json['person'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityName = json['city_name'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    healthPercentage = json['health_percentage'];
    address1 = json['address1'];
    status = json['status'];
    category = json['category'];
    type = json['type'];
    subtype = json['subtype'];
    size = json['size'];
    sizeunit = json['sizeunit'];
    rentAmountUnit = json['rent_amount_unit'];
    hostUserId = json['host_user_id'];
    propertyImage = json['property_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['rent_amount'] = rentAmount;
    data['facilities'] = facilities;
    data['person'] = person;
    data['address'] = address;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_name'] = cityName;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['created_on'] = createdOn;
    data['updated_on'] = updatedOn;
    data['health_percentage'] = healthPercentage;
    data['address1'] = address1;
    data['status'] = status;
    data['category'] = category;
    data['type'] = type;
    data['subtype'] = subtype;
    data['size'] = size;
    data['sizeunit'] = sizeunit;
    data['rent_amount_unit'] = rentAmountUnit;
    data['host_user_id'] = hostUserId;
    data['property_image'] = propertyImage;
    return data;
  }
}
