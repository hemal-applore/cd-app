import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/ui/distributor_detail/distributor_page.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const DistributorDetailsPage();
                },
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              ColorConstants.primaryColor,
            ),
          ),
          child: Text(
            'Show Distributor Details',
            style: TextUtils.poppins(
              const TextStyle(
                fontSize: 16,
                color: ColorConstants.accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
