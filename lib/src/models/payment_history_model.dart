class PaymentHistoryModel {
  String id;
  String mode;
  DateTime date;
  String reward;
  String status;
  String amount;
  String txnRef;

  PaymentHistoryModel({
    required this.id,
    required this.mode,
    required this.date,
    required this.reward,
    required this.status,
    required this.amount,
    required this.txnRef,
  });

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      PaymentHistoryModel(
        id: json['id'],
        mode: json['amount'],
        date: json['date'] != null
            ? DateTime.parse(json['date'])
            : DateTime.now(),
        reward: json['status'],
        status: json['type'],
        amount: json['amount'],
        txnRef: json['txnRef'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'mode': mode,
        'date': date,
        'reward': reward,
        'status': status,
        'amount': amount,
        'txnRef': txnRef
      };
}
