// To parse this JSON data, do
//
//     final leadDataModal = leadDataModalFromJson(jsonString);

import 'dart:convert';

LeadDataModal leadDataModalFromJson(String str) => LeadDataModal.fromJson(json.decode(str));

String leadDataModalToJson(LeadDataModal data) => json.encode(data.toJson());

class LeadDataModal {
  String status;
  dynamic registeredLeads;
  dynamic leadsDisbursed;
  dynamic leadsPotential;
  dynamic leadsProcessed;
  dynamic leadsRejected;
  dynamic leadsApproved;

  LeadDataModal({
    required this.status,
    required this.registeredLeads,
    required this.leadsDisbursed,
    required this.leadsPotential,
    required this.leadsProcessed,
    required this.leadsRejected,
    required this.leadsApproved,
  });

  factory LeadDataModal.fromJson(Map<String, dynamic> json) => LeadDataModal(
    status: json["status"],
    registeredLeads: json["registered_leads"]??0,
    leadsDisbursed: json["leads_disbursed"]??0,
    leadsPotential: json["leads_potential"]??0,
    leadsProcessed: json["leads_processed "]??0,
    leadsRejected: json[" leads_rejected"]??0,
    leadsApproved: json["leads_approved"]??0,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "registered_leads": registeredLeads,
    "leads_disbursed": leadsDisbursed,
    "leads_potential": leadsPotential,
    "leads_processed ": leadsProcessed,
    " leads_rejected": leadsRejected,
    "leads_approved": leadsApproved,
  };
}
