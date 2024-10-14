class GetAllPropertiesModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllPropertiesDataModel>? data;

  GetAllPropertiesModel({this.success, this.code, this.message, this.data});

  GetAllPropertiesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllPropertiesDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllPropertiesDataModel.fromJson(v));
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

class GetAllPropertiesDataModel {
  String? id;
  String? name;
  String? description;
  double? rentAmount;
  String? facilities;
  String? person;
  String? address;
  String? countryId;
  String? stateId;
  String? cityName;
  String? countryName;
  String? stateName;
  String? profilePicture;
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
  String? email;
  String? phoneNumber;
  String? startDate;
  String? endDate;
  List<Amenitys>? amenitys;
  String? propertyImage;

  GetAllPropertiesDataModel(
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
      this.countryName,
      this.stateName,
      this.profilePicture,
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
      this.email,
      this.phoneNumber,
      this.startDate,
      this.endDate,
      this.amenitys,
      this.propertyImage});

  GetAllPropertiesDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    rentAmount = json['rent_amount'] is int
        ? rentAmount = (json['rent_amount'] as int).toDouble()
        : rentAmount = json['rent_amount'];
    facilities = json['facilities'];
    person = json['person'];
    address = json['address'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityName = json['city_name'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    profilePicture = json['profile_picture'];
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
    email = json['email'];
    phoneNumber = json['phone_number'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    if (json['amenitys'] != null) {
      amenitys = <Amenitys>[];
      json['amenitys'].forEach((v) {
        amenitys!.add(Amenitys.fromJson(v));
      });
    }
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
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    data['profile_picture'] = profilePicture;
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
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    if (amenitys != null) {
      data['amenitys'] = amenitys!.map((v) => v.toJson()).toList();
    }
    data['property_image'] = propertyImage;
    return data;
  }
}

class Amenitys {
  String? id;
  String? title;
  String? icon;

  Amenitys({this.id, this.title, this.icon});

  Amenitys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}

class PropertiesRequestModel {
  int? pageSize;
  int? pageNumber;
  String? searchText;
  String? sortBy;
  String? propertyid;
  String? userId;
  String? type;
  bool? onlease;
  String? countryId;
  String? stateId;
  String? cityName;
}

// class GetAllCurrentPropertyModel {
//   bool? success;
//   int? code;
//   String? message;
//   List<GetAllCurrentPropertyDataModel>? data;

//   GetAllCurrentPropertyModel(
//       {this.success, this.code, this.message, this.data});

//   GetAllCurrentPropertyModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <GetAllCurrentPropertyDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(GetAllCurrentPropertyDataModel.fromJson(v));
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

// class GetAllCurrentPropertyDataModel {
//   String? id;
//   String? propertyId;
//   String? tenantUserId;
//   int? rentAmount;
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
//   String? checkoutChecklist;
//   String? checkoutRequestedOn;
//   String? name;
//   String? description;
//   String? facilities;
//   String? person;
//   String? address;
//   String? countryId;
//   String? stateId;
//   String? cityName;
//   String? createdOn;
//   String? healthPercentage;
//   String? address1;
//   String? category;
//   String? type;
//   String? subtype;
//   String? size;
//   String? sizeunit;
//   String? rentAmountUnit;
//   String? firstName;
//   String? lastName;
//   String? propertyImage;

//   GetAllCurrentPropertyDataModel(
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
//       this.name,
//       this.description,
//       this.facilities,
//       this.person,
//       this.address,
//       this.countryId,
//       this.stateId,
//       this.cityName,
//       this.createdOn,
//       this.healthPercentage,
//       this.address1,
//       this.category,
//       this.type,
//       this.subtype,
//       this.size,
//       this.sizeunit,
//       this.rentAmountUnit,
//       this.firstName,
//       this.lastName,
//       this.propertyImage});

//   GetAllCurrentPropertyDataModel.fromJson(Map<String, dynamic> json) {
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
//     checkoutRequested = json['checkout_requested'] ?? false;
//     checkoutChecklist = json['checkout_checklist'];
//     checkoutRequestedOn = json['checkout_requested_on'];
//     name = json['name'];
//     description = json['description'];
//     facilities = json['facilities'];
//     person = json['person'];
//     address = json['address'];
//     countryId = json['country_id'];
//     stateId = json['state_id'];
//     cityName = json['city_name'];
//     createdOn = json['created_on'];
//     healthPercentage = json['health_percentage'];
//     address1 = json['address1'];
//     category = json['category'];
//     type = json['type'];
//     subtype = json['subtype'];
//     size = json['size'];
//     sizeunit = json['sizeunit'];
//     rentAmountUnit = json['rent_amount_unit'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     propertyImage = json['property_image'];
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
//     data['name'] = name;
//     data['description'] = description;
//     data['facilities'] = facilities;
//     data['person'] = person;
//     data['address'] = address;
//     data['country_id'] = countryId;
//     data['state_id'] = stateId;
//     data['city_name'] = cityName;
//     data['created_on'] = createdOn;
//     data['health_percentage'] = healthPercentage;
//     data['address1'] = address1;
//     data['category'] = category;
//     data['type'] = type;
//     data['subtype'] = subtype;
//     data['size'] = size;
//     data['sizeunit'] = sizeunit;
//     data['rent_amount_unit'] = rentAmountUnit;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['property_image'] = propertyImage;
//     return data;
//   }
// }

class GetAllCurrentPropertyModel {
  bool? success;
  int? code;
  String? message;
  GetAllCurrentPropertyDataModel? data;

  GetAllCurrentPropertyModel(
      {this.success, this.code, this.message, this.data});

  GetAllCurrentPropertyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? GetAllCurrentPropertyDataModel.fromJson(json['data'])
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

class GetAllCurrentPropertyDataModel {
  String? id;
  String? propertyId;
  String? tenantUserId;
  int? rentAmount;
  String? startDate;
  String? endDate;
  String? status;
  String? cretedOn;
  String? updatedOn;
  String? createdById;
  String? updatedById;
  bool? isActive;
  String? hostUserId;
  bool? checkoutRequested;
  List? checkoutChecklist;
  String? checkoutRequestedOn;
  String? address;
  String? name;
  String? person;
  String? rentAmountUnit;
  String? firstName;
  String? lastName;
  String? propertyImage;

  GetAllCurrentPropertyDataModel(
      {this.id,
      this.propertyId,
      this.tenantUserId,
      this.rentAmount,
      this.startDate,
      this.endDate,
      this.status,
      this.cretedOn,
      this.updatedOn,
      this.createdById,
      this.updatedById,
      this.isActive,
      this.hostUserId,
      this.checkoutRequested,
      this.checkoutChecklist,
      this.checkoutRequestedOn,
      this.address,
      this.name,
      this.person,
      this.rentAmountUnit,
      this.firstName,
      this.lastName,
      this.propertyImage});

  GetAllCurrentPropertyDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyId = json['property_id'];
    tenantUserId = json['tenant_user_id'];
    rentAmount = json['rent_amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    cretedOn = json['creted_on'];
    updatedOn = json['updated_on'];
    createdById = json['created_by_id'];
    updatedById = json['updated_by_id'];
    isActive = json['is_active'];
    hostUserId = json['host_user_id'];
    checkoutRequested = json['checkout_requested'];
    checkoutChecklist = json['data'] != null ? json['checkout_checklist'] : [];
    checkoutRequestedOn = json['checkout_requested_on'];
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
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['creted_on'] = cretedOn;
    data['updated_on'] = updatedOn;
    data['created_by_id'] = createdById;
    data['updated_by_id'] = updatedById;
    data['is_active'] = isActive;
    data['host_user_id'] = hostUserId;
    data['checkout_requested'] = checkoutRequested;
    data['checkout_checklist'] = checkoutChecklist;
    data['checkout_requested_on'] = checkoutRequestedOn;
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
