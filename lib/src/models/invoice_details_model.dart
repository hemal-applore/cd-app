import 'package:cd_app/src/models/payment_history_model.dart';

class InvoiceDetailsModel {
  String invoiceId;
  String reward;
  DateTime date;
  DateTime dueDate;
  String invoiceAmount;
  String outStandingAmount;
  List<PaymentHistoryModel> paymentHistory;

  InvoiceDetailsModel({
    required this.invoiceId,
    required this.reward,
    required this.date,
    required this.dueDate,
    required this.invoiceAmount,
    required this.outStandingAmount,
    required this.paymentHistory,
  });

  factory InvoiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsModel(
        invoiceId: json['invoiceId'] ?? '',
        reward: json['reward'] ?? '',
        date: json['date'] ?? DateTime.now(),
        dueDate: json['dueDate'] ?? DateTime.now(),
        invoiceAmount: json['invoiceAmount'] ?? '',
        outStandingAmount: json['outStandingAmount'] ?? '',
        paymentHistory: json['paymentHistory'] != null
            ? List<PaymentHistoryModel>.from(
                json['paymentHistory'].map(
                  (x) => PaymentHistoryModel.fromJson(x),
                ),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        'invoiceId': invoiceId,
        'productId': reward,
        'date': date,
        'dueDate': dueDate,
        'invoiceAmount': invoiceAmount,
        'outStandingAmount': outStandingAmount,
        'paymentHistory': paymentHistory.map((x) => x.toJson()).toList(),
      };
}
