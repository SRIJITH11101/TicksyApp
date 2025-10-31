import 'dart:convert';

class TicketReq {
  final String userId;
  final String subject;
  final String description;
  final String originalLang;
  final String translateLang;

  TicketReq({
    required this.userId,
    required this.subject,
    required this.description,
    required this.originalLang,
    required this.translateLang,
  });

  // Convert TicketReq -> JSON map
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'subject': subject,
    'description': description,
    'originalLang': originalLang,
    'translateLang': translateLang,
  };

  // Convert JSON map -> TicketReq
  factory TicketReq.fromJson(Map<String, dynamic> json) => TicketReq(
    userId: json['userId'] ?? '',
    subject: json['subject'] ?? '',
    description: json['description'] ?? '',
    originalLang: json['originalLang'] ?? '',
    translateLang: json['translateLang'] ?? '',
  );

  // Convert object to raw JSON string
  String toRawJson() => json.encode(toJson());

  // Convert raw JSON string to object
  factory TicketReq.fromRawJson(String str) =>
      TicketReq.fromJson(json.decode(str));
}
