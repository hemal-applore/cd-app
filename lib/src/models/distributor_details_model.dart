import 'package:cd_app/src/models/invoice_details_model.dart';

class DistributorDetailsModel {
  DistributorDetailsModel({
    required this.distributorName,
    required this.currentStatus,
    required this.netOutstanding,
    required this.loyaltyPoints,
    required this.creditPeriod,
    required this.totalLimit,
    required this.availableLimit,
    required this.invoiceDetails,
  });

  final String distributorName;
  final String currentStatus;
  final String netOutstanding;
  final String loyaltyPoints;
  final String creditPeriod;
  final String totalLimit;
  final String availableLimit;
  final List<InvoiceDetailsModel> invoiceDetails;

  factory DistributorDetailsModel.fromJson(Map<String, dynamic> json) =>
      DistributorDetailsModel(
        distributorName: json['distributorName'],
        currentStatus: json['currentStatus'],
        netOutstanding: json['netOutstanding'],
        loyaltyPoints: json['loyaltyPoints'],
        creditPeriod: json['creditPeriod'],
        totalLimit: json['totalLimit'],
        availableLimit: json['availableLimit'],
        invoiceDetails: json['invoiceDetails'] != null
            ? List<InvoiceDetailsModel>.from(
                json['invoiceDetails'].map(
                  (x) => InvoiceDetailsModel.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        'distributorName': distributorName,
        'currentStatus': currentStatus,
        'netOutstanding': netOutstanding,
        'loyaltyPoints': loyaltyPoints,
        'creditPeriod': creditPeriod,
        'totalLimit': totalLimit,
        'availableLimit': availableLimit,
        'invoiceDetails': invoiceDetails.map((x) => x.toJson()).toList(),
      };
}
