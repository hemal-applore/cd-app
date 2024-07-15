import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/constants/string_constants.dart';
import 'package:cd_app/src/models/distributor_details_model.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DistributorOverview extends StatefulWidget {
  const DistributorOverview({
    super.key,
    required this.distributorDetails,
  });

  final DistributorDetailsModel distributorDetails;

  @override
  State<DistributorOverview> createState() => _DistributorOverviewState();
}

class _DistributorOverviewState extends State<DistributorOverview> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: ColorConstants.borderColor,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Distributor Name
          Row(
            children: [
              Container(
                height: 43,
                width: 42,
                decoration: BoxDecoration(
                  color: const Color(0xffFBECEC),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Icon(Icons.person),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.distributorDetails.distributorName,
                    style: TextUtils.poppins(
                      const TextStyle(
                        color: ColorConstants.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    widget.distributorDetails.currentStatus,
                    style: TextUtils.poppins(
                      const TextStyle(
                        color: ColorConstants.successColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Net Outstanding
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Net Outstanding',
                    style: TextUtils.poppins(
                      const TextStyle(
                        color: ColorConstants.infoColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                      print('Net Outstanding');
                    },
                    child: isExpanded
                        ? const Icon(Icons.keyboard_arrow_down_rounded)
                        : const Icon(Icons.keyboard_arrow_up_rounded),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Text(
                '${StringConstants.rupeeSymbol}${widget.distributorDetails.netOutstanding}',
                style: TextUtils.poppins(
                  const TextStyle(
                    color: ColorConstants.infoColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          // brief overview
          if (isExpanded)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // loyalty points
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Loyalty Points',
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: ColorConstants.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/coins.svg',
                          width: 12,
                          height: 12,
                        ),
                        Text(
                          widget.distributorDetails.loyaltyPoints,
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: ColorConstants.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //credit period
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Credit Period',
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: ColorConstants.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '${widget.distributorDetails.creditPeriod} Days',
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: ColorConstants.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                //total limit
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Limit',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: ColorConstants.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          'Available Limit',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: ColorConstants.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${StringConstants.rupeeSymbol}${widget.distributorDetails.totalLimit}',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: ColorConstants.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          '${StringConstants.rupeeSymbol}${widget.distributorDetails.availableLimit}',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: ColorConstants.secondaryLightTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}
