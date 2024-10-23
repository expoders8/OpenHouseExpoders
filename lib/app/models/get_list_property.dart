class GetAllListPropertyModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllListPropertyDataModel>? data;

  GetAllListPropertyModel({this.success, this.code, this.message, this.data});

  GetAllListPropertyModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllListPropertyDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllListPropertyDataModel.fromJson(v));
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

class GetAllListPropertyDataModel {
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
  String? numberOfBedrooms;
  String? numberOfWashrooms;
  List<Amenitys>? amenitys;
  String? propertyImages;
  Hostdetails? hostdetails;

  GetAllListPropertyDataModel(
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
      this.numberOfBedrooms,
      this.numberOfWashrooms,
      this.amenitys,
      this.propertyImages,
      this.hostdetails});

  GetAllListPropertyDataModel.fromJson(Map<String, dynamic> json) {
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
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfWashrooms = json['number_of_washrooms'];
    if (json['amenitys'] != null) {
      amenitys = <Amenitys>[];
      json['amenitys'].forEach((v) {
        amenitys!.add(Amenitys.fromJson(v));
      });
    }
    propertyImages = json['property_images'];
    hostdetails = json['Hostdetails'] != null
        ? new Hostdetails.fromJson(json['Hostdetails'])
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
    data['number_of_bedrooms'] = numberOfBedrooms;
    data['number_of_washrooms'] = numberOfWashrooms;
    if (amenitys != null) {
      data['amenitys'] = amenitys!.map((v) => v.toJson()).toList();
    }
    data['property_images'] = propertyImages;
    if (this.hostdetails != null) {
      data['Hostdetails'] = this.hostdetails!.toJson();
    }
    return data;
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
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  String? type;
  String? rating;
  String? createdOn;

  Hostdetails(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profilePicture,
      this.type,
      this.rating,
      this.createdOn});

  Hostdetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['id'] = id;
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
