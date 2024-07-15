import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';

class InvoiceFilter extends StatelessWidget {
  const InvoiceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        print('Filter');
        //TODO: show filter dialog
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorConstants.borderColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'New',
              style: TextUtils.poppins(
                const TextStyle(
                  color: ColorConstants.primaryTextColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.arrow_drop_down,
              color: ColorConstants.primaryTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
