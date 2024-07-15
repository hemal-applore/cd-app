import 'package:cd_app/src/providers/distributor_provider.dart';
import 'package:cd_app/src/ui/distributor_detail/widgets/invoice_items/invoice_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceList extends StatelessWidget {
  const InvoiceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DistributorProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        if (provider.distributorStatus == DistributeStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (provider.distributorStatus == DistributeStatus.error) {
          return Center(
            child: Text(provider.errorMessage ?? 'An error occurred'),
          );
        }
        if (provider.distributorStatus == DistributeStatus.loaded) {
          if (provider.filteredList.isEmpty) {
            return const Center(
              child: Text('No invoices found'),
            );
          }
          return Expanded(
            child: ListView.separated(
              itemCount: provider.filteredList.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InvoiceItem(
                  invoice: provider.filteredList[index],
                );
              },
            ),
          );
        }

        return const Text('An error occurred');
      },
    );
  }
}
