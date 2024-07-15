import 'package:cd_app/src/logic/apis/api_client.dart';
import 'package:cd_app/src/models/api_response.dart';
import 'package:cd_app/src/models/distributor_details_model.dart';
import 'package:cd_app/src/models/invoice_details_model.dart';
import 'package:cd_app/src/utils/app_dropdown.dart';
import 'package:flutter/material.dart';

enum DistributeStatus { loading, loaded, error }

enum InvoiceStatus {
  open,
  closed,
}

class DistributorProvider extends ChangeNotifier {
  final ApiClient _apiClient = ApiClient();
  DistributorDetailsModel? _distributorDetails;
  List<DropDownData> filterList = [
    DropDownData(
      id: '1',
      title: 'Open',
      value: 'open',
    ),
    DropDownData(
      id: '2',
      title: 'Closed',
      value: 'closed',
    ),
  ];
  InvoiceStatus selectFilter = InvoiceStatus.open;
  List<InvoiceDetailsModel> filteredList = [];
  DistributeStatus distributorStatus = DistributeStatus.loading;
  String? errorMessage;

  get distributorDetails => _distributorDetails;

  getDistributorDetails() async {
    // Load distributors from API
    distributorStatus = DistributeStatus.loading;
    final response = await _apiClient.getDistributorDetails(
      filter: selectFilter.name,
    );
    if (response.status == ApiStatus.success) {
      _distributorDetails = response.data;
      filteredList = _distributorDetails?.invoiceDetails ?? [];
      distributorStatus = DistributeStatus.loaded;
    } else {
      _distributorDetails = null;
      distributorStatus = DistributeStatus.error;
      errorMessage = response.errorMessage;
    }
    notifyListeners();
  }

  changeFilter(InvoiceStatus filter) {
    selectFilter = filter;
    notifyListeners();
    getDistributorDetails();
  }
}
