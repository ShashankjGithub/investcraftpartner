// To parse this JSON data, do
//
//     final leadModal = leadModalFromJson(jsonString);

import 'dart:convert';

LeadModal leadModalFromJson(String str) => LeadModal.fromJson(json.decode(str));

String leadModalToJson(LeadModal data) => json.encode(data.toJson());

class LeadModal {
  String status;
  List<Lead> leads;

  LeadModal({
    required this.status,
    required this.leads,
  });

  factory LeadModal.fromJson(Map<String, dynamic> json) => LeadModal(
    status: json["status"],
    leads: List<Lead>.from(json["leads"].map((x) => Lead.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "leads": List<dynamic>.from(leads.map((x) => x.toJson())),
  };
}

class Lead {
  dynamic id;
  dynamic leadNumber;
  dynamic partnerId;
  dynamic memberId;
  dynamic nestedId;
  dynamic firstName;
  dynamic lastName;
  dynamic mobile;
  dynamic email;
  dynamic gender;
  dynamic pan;
  DateTime dob;
  dynamic motherName;
  dynamic employmentType;
  dynamic state;
  dynamic city;
  dynamic pincode;
  dynamic companyName;
  dynamic companyType;
  dynamic residenceType;
  dynamic productType;
  dynamic applyforProduct;
  dynamic loanAmount;
  dynamic monthlyIncome;
  dynamic loanType;
  dynamic residenceAddress;
  dynamic officeAddress;
  dynamic panCardUrl;
  dynamic aadharFrontUrl;
  dynamic aadharBackUrl;
  dynamic otherCurrentAddressProof;
  dynamic incomeProof;
  dynamic bankStatement;
  dynamic businessRegistrationProof;
  dynamic leadStatus;
  dynamic leadSource;
  dynamic callingStatus;
  dynamic assignedAgentId;
  dynamic loanStatus;
  dynamic remarks;
  dynamic approvedLoanAmount;
  dynamic lender;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic parentId;
  dynamic templateKey;
  dynamic value;
  dynamic isTrash;

  Lead({
    required this.id,
    required this.leadNumber,
    required this.partnerId,
    required this.memberId,
    required this.nestedId,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.email,
    required this.gender,
    required this.pan,
    required this.dob,
    required this.motherName,
    required this.employmentType,
    required this.state,
    required this.city,
    required this.pincode,
    required this.companyName,
    required this.companyType,
    required this.residenceType,
    required this.productType,
    required this.applyforProduct,
    required this.loanAmount,
    required this.monthlyIncome,
    required this.loanType,
    required this.residenceAddress,
    required this.officeAddress,
    required this.panCardUrl,
    required this.aadharFrontUrl,
    required this.aadharBackUrl,
    required this.otherCurrentAddressProof,
    required this.incomeProof,
    required this.bankStatement,
    required this.businessRegistrationProof,
    required this.leadStatus,
    required this.leadSource,
    required this.callingStatus,
    required this.assignedAgentId,
    required this.loanStatus,
    required this.remarks,
    required this.approvedLoanAmount,
    required this.lender,
    required this.createdAt,
    required this.updatedAt,
    required this.parentId,
    required this.templateKey,
    required this.value,
    required this.isTrash,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => Lead(
    id: json["id"],
    leadNumber: json["lead_number"],
    partnerId: json["partner_id"],
    memberId: json["member_id"],
    nestedId: json["nested_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    email: json["email"],
    gender: json["gender"],
    pan: json["pan"],
    dob: DateTime.parse(json["dob"]),
    motherName: json["mother_name"],
    employmentType: json["employment_type"],
    state: json["state"],
    city: json["city"],
    pincode: json["pincode"],
    companyName: json["company_name"],
    companyType: json["company_type"],
    residenceType: json["residence_type"],
    productType: json["product_type"],
    applyforProduct: json["applyfor_product"],
    loanAmount: json["loan_amount"],
    monthlyIncome: json["monthly_income"],
    loanType: json["loan_type"],
    residenceAddress: json["residence_address"],
    officeAddress: json["office_address"],
    panCardUrl: json["pan_card_url"],
    aadharFrontUrl: json["aadhar_front_url"],
    aadharBackUrl: json["aadhar_back_url"],
    otherCurrentAddressProof: json["other_current_address_proof"],
    incomeProof: json["income_proof"],
    bankStatement: json["bank_statement"],
    businessRegistrationProof: json["business_registration_proof"],
    leadStatus: json["lead_status"],
    leadSource: json["lead_source"],
    callingStatus: json["calling_status"],
    assignedAgentId: json["assigned_agent_id"],
    loanStatus: json["loan_status"],
    remarks: json["remarks"],
    approvedLoanAmount: json["approved_loan_amount"],
    lender: json["lender"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    parentId: json["parent_id"],
    templateKey: json["template_key"],
    value: json["value"],
    isTrash: json["is_trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_number": leadNumber,
    "partner_id": partnerId,
    "member_id": memberId,
    "nested_id": nestedId,
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobile,
    "email": email,
    "gender": gender,
    "pan": pan,
    "dob": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "mother_name": motherName,
    "employment_type": employmentType,
    "state": state,
    "city": city,
    "pincode": pincode,
    "company_name": companyName,
    "company_type": companyType,
    "residence_type": residenceType,
    "product_type": productType,
    "applyfor_product": applyforProduct,
    "loan_amount": loanAmount,
    "monthly_income": monthlyIncome,
    "loan_type": loanType,
    "residence_address": residenceAddress,
    "office_address": officeAddress,
    "pan_card_url": panCardUrl,
    "aadhar_front_url": aadharFrontUrl,
    "aadhar_back_url": aadharBackUrl,
    "other_current_address_proof": otherCurrentAddressProof,
    "income_proof": incomeProof,
    "bank_statement": bankStatement,
    "business_registration_proof": businessRegistrationProof,
    "lead_status": leadStatus,
    "lead_source": leadSource,
    "calling_status": callingStatus,
    "assigned_agent_id": assignedAgentId,
    "loan_status": loanStatus,
    "remarks": remarks,
    "approved_loan_amount": approvedLoanAmount,
    "lender": lender,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "parent_id": parentId,
    "template_key": templateKey,
    "value": value,
    "is_trash": isTrash,
  };
}
