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
    data['property_image'] = propertyImage;
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
