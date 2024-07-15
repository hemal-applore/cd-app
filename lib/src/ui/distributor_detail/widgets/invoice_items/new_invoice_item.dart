import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/constants/string_constants.dart';
import 'package:cd_app/src/utils/app_button.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';

class NewInvoiceItem extends StatelessWidget {
  const NewInvoiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Invoice : ',
                        style: TextUtils.poppins(
                          const TextStyle(
                            color: Color(0xff888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '#123456',
                        style: TextUtils.poppins(
                          const TextStyle(
                            color: ColorConstants.primaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Date : ',
                        style: TextUtils.poppins(
                          const TextStyle(
                            color: Color(0xff888888),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        '12/12/2021',
                        style: TextUtils.poppins(
                          const TextStyle(
                            color: ColorConstants.primaryTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${StringConstants.rupeeSymbol}78600',
                style: TextUtils.poppins(
                  const TextStyle(
                    color: ColorConstants.infoColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: AppButton(
                  title: 'Accept',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AppButton(
                  title: 'Reject',
                  titleColor: ColorConstants.primaryColor,
                  color: ColorConstants.whiteColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
