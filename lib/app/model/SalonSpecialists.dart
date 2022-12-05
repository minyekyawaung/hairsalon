class SalonSpecialists {
  SalonSpecialists({
    required this.data,
  });
  late final List<Data> data;

  SalonSpecialists.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.userType,
    required this.surname,
    required this.firstName,
    this.lastName,
    required this.username,
    required this.email,
    required this.language,
    this.contactNo,
    this.address,
    required this.businessId,
    this.availableAt,
    this.pausedAt,
    this.essentialsDepartmentId,
    this.essentialsDesignationId,
    this.essentialsSalary,
    this.essentialsPayPeriod,
    this.essentialsPayCycle,
    this.maxSalesDiscountPercent,
    required this.allowLogin,
    required this.status,
    this.crmContactId,
    required this.isCmmsnAgnt,
    required this.cmmsnPercent,
    required this.selectedContacts,
    this.dob,
    this.gender,
    this.maritalStatus,
    this.bloodGroup,
    this.contactNumber,
    this.altNumber,
    this.familyNumber,
    this.fbLink,
    this.twitterLink,
    this.socialMedia_1,
    this.socialMedia_2,
    this.permanentAddress,
    this.currentAddress,
    this.guardianName,
    this.customField_1,
    this.customField_2,
    this.customField_3,
    this.customField_4,
    this.bankDetails,
    this.idProofName,
    this.idProofNumber,
    this.crmDepartment,
    this.crmDesignation,
    this.locationId,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userType;
  late final String surname;
  late final String firstName;
  late final String? lastName;
  late final String username;
  late final String email;
  late final String language;
  late final String? contactNo;
  late final Null address;
  late final int businessId;
  late final Null availableAt;
  late final Null pausedAt;
  late final Null essentialsDepartmentId;
  late final Null essentialsDesignationId;
  late final Null essentialsSalary;
  late final String? essentialsPayPeriod;
  late final Null essentialsPayCycle;
  late final Null maxSalesDiscountPercent;
  late final int allowLogin;
  late final String status;
  late final int? crmContactId;
  late final int isCmmsnAgnt;
  late final String cmmsnPercent;
  late final int selectedContacts;
  late final Null dob;
  late final Null gender;
  late final Null maritalStatus;
  late final Null bloodGroup;
  late final Null contactNumber;
  late final String? altNumber;
  late final String? familyNumber;
  late final Null fbLink;
  late final Null twitterLink;
  late final Null socialMedia_1;
  late final Null socialMedia_2;
  late final Null permanentAddress;
  late final Null currentAddress;
  late final Null guardianName;
  late final Null customField_1;
  late final Null customField_2;
  late final Null customField_3;
  late final Null customField_4;
  late final String? bankDetails;
  late final Null idProofName;
  late final Null idProofNumber;
  late final Null crmDepartment;
  late final Null crmDesignation;
  late final Null locationId;
  late final Null deletedAt;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    surname = json['surname'];
    firstName = json['first_name'];
    lastName = null;
    username = json['username'];
    email = json['email'];
    language = json['language'];
    contactNo = null;
    address = null;
    businessId = json['business_id'];
    availableAt = null;
    pausedAt = null;
    essentialsDepartmentId = null;
    essentialsDesignationId = null;
    essentialsSalary = null;
    essentialsPayPeriod = null;
    essentialsPayCycle = null;
    maxSalesDiscountPercent = null;
    allowLogin = json['allow_login'];
    status = json['status'];
    crmContactId = null;
    isCmmsnAgnt = json['is_cmmsn_agnt'];
    cmmsnPercent = json['cmmsn_percent'];
    selectedContacts = json['selected_contacts'];
    dob = null;
    gender = null;
    maritalStatus = null;
    bloodGroup = null;
    contactNumber = null;
    altNumber = null;
    familyNumber = null;
    fbLink = null;
    twitterLink = null;
    socialMedia_1 = null;
    socialMedia_2 = null;
    permanentAddress = null;
    currentAddress = null;
    guardianName = null;
    customField_1 = null;
    customField_2 = null;
    customField_3 = null;
    customField_4 = null;
    bankDetails = null;
    idProofName = null;
    idProofNumber = null;
    crmDepartment = null;
    crmDesignation = null;
    locationId = null;
    deletedAt = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_type'] = userType;
    _data['surname'] = surname;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['username'] = username;
    _data['email'] = email;
    _data['language'] = language;
    _data['contact_no'] = contactNo;
    _data['address'] = address;
    _data['business_id'] = businessId;
    _data['available_at'] = availableAt;
    _data['paused_at'] = pausedAt;
    _data['essentials_department_id'] = essentialsDepartmentId;
    _data['essentials_designation_id'] = essentialsDesignationId;
    _data['essentials_salary'] = essentialsSalary;
    _data['essentials_pay_period'] = essentialsPayPeriod;
    _data['essentials_pay_cycle'] = essentialsPayCycle;
    _data['max_sales_discount_percent'] = maxSalesDiscountPercent;
    _data['allow_login'] = allowLogin;
    _data['status'] = status;
    _data['crm_contact_id'] = crmContactId;
    _data['is_cmmsn_agnt'] = isCmmsnAgnt;
    _data['cmmsn_percent'] = cmmsnPercent;
    _data['selected_contacts'] = selectedContacts;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['marital_status'] = maritalStatus;
    _data['blood_group'] = bloodGroup;
    _data['contact_number'] = contactNumber;
    _data['alt_number'] = altNumber;
    _data['family_number'] = familyNumber;
    _data['fb_link'] = fbLink;
    _data['twitter_link'] = twitterLink;
    _data['social_media_1'] = socialMedia_1;
    _data['social_media_2'] = socialMedia_2;
    _data['permanent_address'] = permanentAddress;
    _data['current_address'] = currentAddress;
    _data['guardian_name'] = guardianName;
    _data['custom_field_1'] = customField_1;
    _data['custom_field_2'] = customField_2;
    _data['custom_field_3'] = customField_3;
    _data['custom_field_4'] = customField_4;
    _data['bank_details'] = bankDetails;
    _data['id_proof_name'] = idProofName;
    _data['id_proof_number'] = idProofNumber;
    _data['crm_department'] = crmDepartment;
    _data['crm_designation'] = crmDesignation;
    _data['location_id'] = locationId;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
