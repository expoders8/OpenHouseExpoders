class PropertyDetailModel {
  bool? success;
  int? code;
  String? message;
  PropertyDetailDataModel? data;

  PropertyDetailModel({this.success, this.code, this.message, this.data});

  PropertyDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? PropertyDetailDataModel.fromJson(json['data'])
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

class PropertyDetailDataModel {
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
  String? profilePicture;
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
  String? numberofbedrooms;
  String? numberofwashrooms;
  String? rentAmountUnit;
  String? tenantFirstName;
  String? tenantLastName;
  String? tenantEmail;
  String? tenantPhoneNumber;
  String? tenantProfilePicture;
  String? tenantType;
  String? countryName;
  String? stateName;
  List<Amenitys>? amenitys;
  List<String>? images;
  Hostdetails? hostdetails;
  Tenantdetails? tenantdetails;

  PropertyDetailDataModel(
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
      this.profilePicture,
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
      this.numberofbedrooms,
      this.numberofwashrooms,
      this.rentAmountUnit,
      this.tenantFirstName,
      this.tenantLastName,
      this.tenantEmail,
      this.tenantPhoneNumber,
      this.tenantProfilePicture,
      this.tenantType,
      this.countryName,
      this.stateName,
      this.amenitys,
      this.images,
      this.hostdetails,
      this.tenantdetails});

  PropertyDetailDataModel.fromJson(Map<String, dynamic> json) {
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
    profilePicture = json['profile_picture'];
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
    numberofbedrooms = json['number_of_bedrooms'];
    numberofwashrooms = json['number_of_washrooms'];
    rentAmountUnit = json['rent_amount_unit'];
    tenantFirstName = json['tenant_first_name'];
    tenantLastName = json['tenant_last_name'];
    tenantEmail = json['tenant_email'];
    tenantPhoneNumber = json['tenant_phone_number'];
    tenantProfilePicture = json['tenant_profile_picture'];
    tenantType = json['tenant_type'];
    countryName = json['country_name'];
    stateName = json['state_name'];
    if (json['amenitys'] != null) {
      amenitys = <Amenitys>[];
      json['amenitys'].forEach((v) {
        amenitys!.add(Amenitys.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
    hostdetails = json['Hostdetails'] != null
        ? Hostdetails.fromJson(json['Hostdetails'])
        : null;
    tenantdetails = json['tenantdetails'] != null
        ? Tenantdetails.fromJson(json['tenantdetails'])
        : null;
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
    data['profile_picture'] = profilePicture;
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
    data['tenant_first_name'] = tenantFirstName;
    data['tenant_last_name'] = tenantLastName;
    data['tenant_email'] = tenantEmail;
    data['tenant_phone_number'] = tenantPhoneNumber;
    data['tenant_profile_picture'] = tenantProfilePicture;
    data['tenant_type'] = tenantType;
    data['country_name'] = countryName;
    data['state_name'] = stateName;
    if (amenitys != null) {
      data['amenitys'] = amenitys!.map((v) => v.toJson()).toList();
    }
    data['images'] = images;
    if (hostdetails != null) {
      data['Hostdetails'] = hostdetails!.toJson();
    }
    if (tenantdetails != null) {
      data['tenantdetails'] = tenantdetails!.toJson();
    }
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

class Hostdetails {
  String? createdById;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  String? type;
  String? rating;
  String? createdOn;

  Hostdetails(
      {this.createdById,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profilePicture,
      this.type,
      this.rating,
      this.createdOn});

  Hostdetails.fromJson(Map<String, dynamic> json) {
    createdById = json['created_by_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    profilePicture = json['profile_picture'];
    type = json['type'];
    rating = json['rating'];
    createdOn = json['created_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_by_id'] = createdById;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['profile_picture'] = profilePicture;
    data['type'] = type;
    data['rating'] = rating;
    data['created_on'] = createdOn;
    return data;
  }
}

class Tenantdetails {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  String? type;

  Tenantdetails(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profilePicture,
      this.type});

  Tenantdetails.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    profilePicture = json['profile_picture'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['profile_picture'] = profilePicture;
    data['type'] = type;
    return data;
  }
}
