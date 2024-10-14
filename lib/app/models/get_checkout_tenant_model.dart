// class GetAllCheckoutRequestTenantModel {
//   bool? success;
//   int? code;
//   String? message;
//   List<GetAllCheckoutRequestTenantDataModel>? data;

//   GetAllCheckoutRequestTenantModel(
//       {this.success, this.code, this.message, this.data});

//   GetAllCheckoutRequestTenantModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     code = json['code'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <GetAllCheckoutRequestTenantDataModel>[];
//       json['data'].forEach((v) {
//         data!.add(GetAllCheckoutRequestTenantDataModel.fromJson(v));
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

// class GetAllCheckoutRequestTenantDataModel {
//   String? propertyId;
//   String? propertyName;
//   String? propertyAddress;
//   List<CheckoutChecklist>? checkoutChecklist;
//   String? propertyImage;
//   List<Rentals>? rentals;

//   GetAllCheckoutRequestTenantDataModel(
//       {this.propertyId,
//       this.propertyName,
//       this.propertyAddress,
//       this.checkoutChecklist,
//       this.propertyImage,
//       this.rentals});

//   GetAllCheckoutRequestTenantDataModel.fromJson(Map<String, dynamic> json) {
//     propertyId = json['property_id'];
//     propertyName = json['property_name'];
//     propertyAddress = json['property_address'];
//     if (json['checkout_checklist'] != null) {
//       checkoutChecklist = <CheckoutChecklist>[];
//       json['checkout_checklist'].forEach((v) {
//         checkoutChecklist!.add(CheckoutChecklist.fromJson(v));
//       });
//     }
//     propertyImage = json['property_image'];
//     if (json['rentals'] != null) {
//       rentals = <Rentals>[];
//       json['rentals'].forEach((v) {
//         rentals!.add(Rentals.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['property_id'] = propertyId;
//     data['property_name'] = propertyName;
//     data['property_address'] = propertyAddress;
//     if (checkoutChecklist != null) {
//       data['checkout_checklist'] =
//           checkoutChecklist!.map((v) => v.toJson()).toList();
//     }
//     data['property_image'] = propertyImage;
//     if (rentals != null) {
//       data['rentals'] = rentals!.map((v) => v.toJson()).toList();
//     }
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
//   String? comment;

//   CheckoutChecklist(
//       {this.removePersonalBelongings,
//       this.checkForDamages,
//       this.returnKeys,
//       this.swimmingPool,
//       this.payOutstandingBills,
//       this.cleanRoom,
//       this.electricity,
//       this.comment});

//   CheckoutChecklist.fromJson(Map<String, dynamic> json) {
//     removePersonalBelongings = json['Remove Personal Belongings'];
//     checkForDamages = json['Check for Damages'];
//     returnKeys = json['Return Keys'];
//     swimmingPool = json['Swimming Pool'];
//     payOutstandingBills = json['Pay Outstanding Bills'];
//     cleanRoom = json['Clean Room'];
//     electricity = json['Electricity'];
//     comment = json['Comment'];
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
//     data['Comment'] = comment;
//     return data;
//   }
// }

// class Rentals {
//   String? startDate;
//   String? endDate;
//   String? cretedOn;
//   String? rentAmount;

//   Rentals({this.startDate, this.endDate, this.cretedOn, this.rentAmount});

//   Rentals.fromJson(Map<String, dynamic> json) {
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     cretedOn = json['creted_on'];
//     rentAmount = json['rent_amount'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['start_date'] = startDate;
//     data['end_date'] = endDate;
//     data['creted_on'] = cretedOn;
//     data['rent_amount'] = rentAmount;
//     return data;
//   }
// }

class GetAllCheckoutRequestTenantModel {
  bool? success;
  int? code;
  String? message;
  List<GetAllCheckoutRequestTenantDataModel>? data;

  GetAllCheckoutRequestTenantModel(
      {this.success, this.code, this.message, this.data});

  GetAllCheckoutRequestTenantModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllCheckoutRequestTenantDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllCheckoutRequestTenantDataModel.fromJson(v));
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

class GetAllCheckoutRequestTenantDataModel {
  String? propertyId;
  String? propertyName;
  String? propertyAddress;
  List<UpdatedChecklist>? updatedChecklist;
  String? propertyImage;
  List<Rentals>? rentals;

  GetAllCheckoutRequestTenantDataModel(
      {this.propertyId,
      this.propertyName,
      this.propertyAddress,
      this.updatedChecklist,
      this.propertyImage,
      this.rentals});

  GetAllCheckoutRequestTenantDataModel.fromJson(Map<String, dynamic> json) {
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    propertyAddress = json['property_address'];
    if (json['updatedChecklist'] != null) {
      updatedChecklist = <UpdatedChecklist>[];
      json['updatedChecklist'].forEach((v) {
        updatedChecklist!.add(UpdatedChecklist.fromJson(v));
      });
    }
    propertyImage = json['property_image'];
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(Rentals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['property_id'] = propertyId;
    data['property_name'] = propertyName;
    data['property_address'] = propertyAddress;
    if (updatedChecklist != null) {
      data['updatedChecklist'] =
          updatedChecklist!.map((v) => v.toJson()).toList();
    }
    data['property_image'] = propertyImage;
    if (rentals != null) {
      data['rentals'] = rentals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpdatedChecklist {
  String? name;
  dynamic? isActive;

  UpdatedChecklist({this.name, this.isActive});

  UpdatedChecklist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['name'] == "Comment") {
      isActive = json['isActive'].toString();
    } else {
      isActive = json['isActive'];
    }
    // if (json['isActive'] is bool) {
    //
    // } else if (json['isActive'] is String) {
    //   isActive = json['isActive'].toLowerCase();
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isActive'] = isActive;
    return data;
  }
}

class Rentals {
  String? startDate;
  String? endDate;
  String? cretedOn;
  String? rentAmount;

  Rentals({this.startDate, this.endDate, this.cretedOn, this.rentAmount});

  Rentals.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    cretedOn = json['creted_on'];
    rentAmount = json['rent_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['creted_on'] = cretedOn;
    data['rent_amount'] = rentAmount;
    return data;
  }
}
