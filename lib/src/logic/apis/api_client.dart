import 'package:cd_app/src/models/api_response.dart';
import 'package:cd_app/src/models/invoice_details_model.dart';
import 'package:cd_app/src/models/payment_history_model.dart';

import '../../models/distributor_details_model.dart';

class ApiClient {
  static final ApiClient singleton = ApiClient._internal();

  factory ApiClient() => singleton;

  ApiClient._internal() {
    // Initialize the API client
  }

  Future<ApiResponse<DistributorDetailsModel>> getDistributorDetails({
    required String filter,
  }) async {
    // Get distributor details from API
    try {
      // TODO Add API here
      if (filter == 'open') {
        final data = DistributorDetailsModel(
          netOutstanding: '1',
          distributorName: 'Distributor 1',
          currentStatus: 'Current',
          loyaltyPoints: '200',
          creditPeriod: '30',
          totalLimit: '2000',
          availableLimit: '1000',
          invoiceDetails: [
            InvoiceDetailsModel(
              invoiceId: '#1223',
              reward: '200',
              date: DateTime.now(),
              dueDate: DateTime.now().add(const Duration(days: 3)),
              invoiceAmount: '100',
              outStandingAmount: '400',
              paymentHistory: [
                PaymentHistoryModel(
                  date: DateTime.now(),
                  amount: '100',
                  id: 're',
                  mode: 'UPI',
                  reward: '300',
                  status: 'Success',
                  txnRef: '43443222',
                ),
              ],
            ),
            InvoiceDetailsModel(
              invoiceId: '#1223',
              reward: '200',
              date: DateTime.now(),
              dueDate: DateTime.now().add(const Duration(days: 3)),
              invoiceAmount: '100',
              outStandingAmount: '100',
              paymentHistory: [
                PaymentHistoryModel(
                  date: DateTime.now(),
                  amount: '100',
                  id: 're',
                  mode: 'UPI',
                  reward: '300',
                  status: 'Success',
                  txnRef: '43443222',
                ),
              ],
            ),
            InvoiceDetailsModel(
              invoiceId: '#1223',
              reward: '200',
              date: DateTime.now(),
              dueDate: DateTime.now().add(const Duration(days: 3)),
              invoiceAmount: '100',
              outStandingAmount: '200',
              paymentHistory: [
                PaymentHistoryModel(
                  date: DateTime.now(),
                  amount: '100',
                  id: 're',
                  mode: 'UPI',
                  reward: '300',
                  status: 'Success',
                  txnRef: '43443222',
                ),
              ],
            ),
          ],
        );
        await Future.delayed(const Duration(seconds: 2));
        return ApiResponse.success(data);
      }
      final data = DistributorDetailsModel(
        netOutstanding: '1',
        distributorName: 'Distributor 1',
        currentStatus: 'Current',
        loyaltyPoints: '200',
        creditPeriod: '30',
        totalLimit: '2000',
        availableLimit: '1000',
        invoiceDetails: [
          InvoiceDetailsModel(
            invoiceId: '#1223',
            reward: '200',
            date: DateTime.now(),
            dueDate: DateTime.now().add(const Duration(days: 3)),
            invoiceAmount: '100',
            outStandingAmount: '0',
            paymentHistory: [
              PaymentHistoryModel(
                date: DateTime.now(),
                amount: '100',
                id: 're',
                mode: 'UPI',
                reward: '300',
                status: 'Success',
                txnRef: '43443222',
              ),
              PaymentHistoryModel(
                date: DateTime.now(),
                amount: '50',
                id: '1232291u',
                mode: 'UPI',
                reward: '300',
                status: 'Success',
                txnRef: '43443222',
              ),
            ],
          ),
          InvoiceDetailsModel(
            invoiceId: '#1223',
            reward: '200',
            date: DateTime.now(),
            dueDate: DateTime.now().add(const Duration(days: 3)),
            invoiceAmount: '100',
            outStandingAmount: '0',
            paymentHistory: [
              PaymentHistoryModel(
                date: DateTime.now(),
                amount: '100',
                id: 're',
                mode: 'UPI',
                reward: '300',
                status: 'Success',
                txnRef: '43443222',
              ),
            ],
          ),
          InvoiceDetailsModel(
            invoiceId: '#1223',
            reward: '200',
            date: DateTime.now(),
            dueDate: DateTime.now().add(const Duration(days: 3)),
            invoiceAmount: '100',
            outStandingAmount: '0',
            paymentHistory: [
              PaymentHistoryModel(
                date: DateTime.now(),
                amount: '100',
                id: 're',
                mode: 'UPI',
                reward: '300',
                status: 'Success',
                txnRef: '43443222',
              ),
            ],
          ),
        ],
      );
      await Future.delayed(const Duration(seconds: 2));
      return ApiResponse.success(data);
    } catch (e) {
      return ApiResponse.error("Unexpected Error: $e");
    }
  }
}
