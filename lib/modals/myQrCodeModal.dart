// To parse this JSON data, do
//
//     final myQrCodeModal = myQrCodeModalFromJson(jsonString);

import 'dart:convert';

MyQrCodeModal myQrCodeModalFromJson(String str) => MyQrCodeModal.fromJson(json.decode(str));

String myQrCodeModalToJson(MyQrCodeModal data) => json.encode(data.toJson());

class MyQrCodeModal {
  dynamic statue;
  UserData userData;
  PersonalDetail personalDetail;
  dynamic parterId;

  MyQrCodeModal({
    required this.statue,
    required this.userData,
    required this.personalDetail,
    required this.parterId,
  });

  factory MyQrCodeModal.fromJson(Map<String, dynamic> json) => MyQrCodeModal(
    statue: json["statue"],
    userData: UserData.fromJson(json["user_data"]),
    personalDetail: PersonalDetail.fromJson(json["personal_detail"]),
    parterId: json["parter_id"],
  );

  Map<String, dynamic> toJson() => {
    "statue": statue,
    "user_data": userData.toJson(),
    "personal_detail": personalDetail.toJson(),
    "parter_id": parterId,
  };
}

class PersonalDetail {
  dynamic id;
  dynamic userId;
  dynamic pan;
  dynamic aadhar;
  dynamic permanentAddress;
  dynamic isPermanetPresentSame;
  dynamic presentAddress;
  dynamic state;
  dynamic city;
  dynamic pin;
  dynamic education;
  dynamic panUrl;
  dynamic aadharUrl;
  dynamic photoUrl;
  dynamic businessPhotoUrl;
  dynamic businessLogoUrl;
  dynamic agreementContractId;
  dynamic agreementCustomerId;
  dynamic response;
  DateTime createdAt;
  DateTime updatedAt;

  PersonalDetail({
    required this.id,
    required this.userId,
    required this.pan,
    required this.aadhar,
    required this.permanentAddress,
    required this.isPermanetPresentSame,
    required this.presentAddress,
    required this.state,
    required this.city,
    required this.pin,
    required this.education,
    required this.panUrl,
    required this.aadharUrl,
    required this.photoUrl,
    required this.businessPhotoUrl,
    required this.businessLogoUrl,
    required this.agreementContractId,
    required this.agreementCustomerId,
    required this.response,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PersonalDetail.fromJson(Map<String, dynamic> json) => PersonalDetail(
    id: json["id"],
    userId: json["user_id"],
    pan: json["pan"],
    aadhar: json["aadhar"],
    permanentAddress: json["permanent_address"],
    isPermanetPresentSame: json["is_permanet_present_same"],
    presentAddress: json["present_address"],
    state: json["state"],
    city: json["city"],
    pin: json["pin"],
    education: json["education"],
    panUrl: json["pan_url"],
    aadharUrl: json["aadhar_url"],
    photoUrl: json["photo_url"],
    businessPhotoUrl: json["business_photo_url"],
    businessLogoUrl: json["business_logo_url"],
    agreementContractId: json["agreement_contract_id"],
    agreementCustomerId: json["agreement_customer_id"],
    response: json["response"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "pan": pan,
    "aadhar": aadhar,
    "permanent_address": permanentAddress,
    "is_permanet_present_same": isPermanetPresentSame,
    "present_address": presentAddress,
    "state": state,
    "city": city,
    "pin": pin,
    "education": education,
    "pan_url": panUrl,
    "aadhar_url": aadharUrl,
    "photo_url": photoUrl,
    "business_photo_url": businessPhotoUrl,
    "business_logo_url": businessLogoUrl,
    "agreement_contract_id": agreementContractId,
    "agreement_customer_id": agreementCustomerId,
    "response": response,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class UserData {
  dynamic id;
  dynamic parentId;
  dynamic partnerId;
  dynamic leadId;
  dynamic memberId;
  dynamic name;
  dynamic email;
  dynamic role;
  dynamic gender;
  DateTime dob;
  dynamic accountStatus;
  dynamic emailVerification;
  dynamic mobile;
  dynamic mobileVerification;
  dynamic kycStatus;
  dynamic qrImage;
  dynamic resetPasswordToken;
  DateTime createdAt;
  DateTime updatedAt;

  UserData({
    required this.id,
    required this.parentId,
    required this.partnerId,
    required this.leadId,
    required this.memberId,
    required this.name,
    required this.email,
    required this.role,
    required this.gender,
    required this.dob,
    required this.accountStatus,
    required this.emailVerification,
    required this.mobile,
    required this.mobileVerification,
    required this.kycStatus,
    required this.qrImage,
    required this.resetPasswordToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json["id"],
    parentId: json["parent_id"],
    partnerId: json["partner_id"],
    leadId: json["lead_id"],
    memberId: json["member_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    gender: json["gender"],
    dob: DateTime.parse(json["dob"]),
    accountStatus: json["account_status"],
    emailVerification: json["email_verification"],
    mobile: json["mobile"],
    mobileVerification: json["mobile_verification"],
    kycStatus: json["kyc_status"],
    qrImage: json["qr_image"],
    resetPasswordToken: json["reset_password_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "partner_id": partnerId,
    "lead_id": leadId,
    "member_id": memberId,
    "name": name,
    "email": email,
    "role": role,
    "gender": gender,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "account_status": accountStatus,
    "email_verification": emailVerification,
    "mobile": mobile,
    "mobile_verification": mobileVerification,
    "kyc_status": kycStatus,
    "qr_image": qrImage,
    "reset_password_token": resetPasswordToken,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
