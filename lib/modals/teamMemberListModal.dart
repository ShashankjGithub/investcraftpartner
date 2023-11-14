// To parse this JSON data, do
//
//     final teamMemberListModal = teamMemberListModalFromJson(jsonString);

import 'dart:convert';

TeamMemberListModal teamMemberListModalFromJson(String str) => TeamMemberListModal.fromJson(json.decode(str));

String teamMemberListModalToJson(TeamMemberListModal data) => json.encode(data.toJson());

class TeamMemberListModal {
  List<DatumTeam> data;

  TeamMemberListModal({
    required this.data,
  });

  factory TeamMemberListModal.fromJson(Map<String, dynamic> json) => TeamMemberListModal(
    data: List<DatumTeam>.from(json["data"].map((x) => DatumTeam.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumTeam {
  dynamic id;
  dynamic parentId;
  dynamic partnerId;
  dynamic leadId;
  dynamic memberId;
  dynamic name;
  dynamic email;
  dynamic role;
  dynamic gender;
  dynamic dob;
  dynamic accountStatus;
  dynamic emailVerification;
  dynamic mobile;
  dynamic mobileVerification;
  dynamic kycStatus;
  dynamic qrImage;
  dynamic resetPasswordToken;
  DateTime createdAt;
  DateTime updatedAt;

  DatumTeam({
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

  factory DatumTeam.fromJson(Map<String, dynamic> json) => DatumTeam(
    id: json["id"],
    parentId: json["parent_id"],
    partnerId: json["partner_id"],
    leadId: json["lead_id"],
    memberId: json["member_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    gender: json["gender"],
    dob: json["dob"],
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
    "dob": dob,
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
