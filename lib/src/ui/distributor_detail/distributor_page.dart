import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/providers/distributor_provider.dart';
import 'package:cd_app/src/ui/distributor_detail/widgets/distributor_overview.dart';
import 'package:cd_app/src/ui/distributor_detail/widgets/invoice_items/invoice_item.dart';
import 'package:cd_app/src/ui/distributor_detail/widgets/invoice_list.dart';
import 'package:cd_app/src/utils/app_dropdown.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DistributorDetailsPage extends StatefulWidget {
  const DistributorDetailsPage({super.key});

  @override
  State<DistributorDetailsPage> createState() => _DistributorDetailsPageState();
}

class _DistributorDetailsPageState extends State<DistributorDetailsPage> {
  @override
  void initState() {
    Provider.of<DistributorProvider>(context, listen: false)
        .getDistributorDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back_arrow.svg',
            width: 18,
            height: 18,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Distributor Details',
          style: TextUtils.poppins(
            const TextStyle(
              color: ColorConstants.primaryTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Consumer<DistributorProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          final status = provider.distributorStatus;
          if (status == DistributeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (status == DistributeStatus.error) {
            return Center(
              child: Text('An error occurred: ${provider.errorMessage} '),
            );
          } else if (status == DistributeStatus.loaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  DistributorOverview(
                    distributorDetails: provider.distributorDetails,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 23,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Invoices',
                          style: TextStyle(
                            color: ColorConstants.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppDropdown(
                          items: provider.filterList,
                          selectedValue: provider.filterList.where((element) {
                            return element.value == provider.selectFilter.name;
                          }).first,
                          onChanged: (value) {
                            if (value != null) {
                              if (value.value == 'closed') {
                                provider.changeFilter(InvoiceStatus.closed);
                              } else if (value.value == 'open') {
                                provider.changeFilter(InvoiceStatus.open);
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  InvoiceList(),
                ],
              ),
            );
          }
          return const Center(
            child: Text('Error Occured'),
          );
        },
      ),
    );
  }
}
