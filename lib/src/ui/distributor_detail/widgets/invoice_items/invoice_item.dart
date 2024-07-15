import 'package:cd_app/src/constants/color_constants.dart';
import 'package:cd_app/src/constants/string_constants.dart';
import 'package:cd_app/src/models/invoice_details_model.dart';
import 'package:cd_app/src/models/payment_history_model.dart';
import 'package:cd_app/src/utils/datetime_extension.dart';
import 'package:cd_app/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InvoiceItem extends StatefulWidget {
  const InvoiceItem({
    super.key,
    required this.invoice,
  });

  final InvoiceDetailsModel invoice;

  @override
  State<InvoiceItem> createState() => _InvoiceItemState();
}

class _InvoiceItemState extends State<InvoiceItem> {
  bool isShowMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
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
                          widget.invoice.invoiceId,
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
                          'Due Date : ',
                          overflow: TextOverflow.fade,
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          widget.invoice.dueDate.toDDMMYYYY(),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Invoice Amount',
                          overflow: TextOverflow.fade,
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          '${StringConstants.rupeeSymbol}${widget.invoice.invoiceAmount}',
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
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          widget.invoice.date.toDDMMYYYY(),
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
                          'Reward : ',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 14,
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
                              widget.invoice.reward,
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
                    const SizedBox(height: 10),
                    int.parse(widget.invoice.outStandingAmount) <= 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffDCF0E9),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Paid',
                                    style: TextUtils.poppins(
                                      const TextStyle(
                                        color: Color(0xff66B043),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Outstanding',
                                overflow: TextOverflow.fade,
                                style: TextUtils.poppins(
                                  const TextStyle(
                                    color: Color(0xff888888),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${StringConstants.rupeeSymbol}78900',
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
                  ],
                ),
              ],
            ),
          ),
          // status
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              bottom: 15,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF2F1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Delayed by 10 days',
                    style: TextUtils.poppins(
                      const TextStyle(
                        color: Color(0xffD55F5A),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      isShowMore = !isShowMore;
                    });
                  },
                  child: Icon(
                    isShowMore
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 20,
                  ),
                )
              ],
            ),
          ),

          //more details
          if (isShowMore)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  color: ColorConstants.dividerColor,
                  thickness: 1,
                ),
                ListView.separated(
                  itemCount: widget.invoice.paymentHistory.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: ColorConstants.dividerColor,
                        thickness: 1,
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return _PaymentHistoryItem(
                      payment: widget.invoice.paymentHistory[index],
                    );
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _PaymentHistoryItem extends StatelessWidget {
  const _PaymentHistoryItem({
    required this.payment,
  });

  final PaymentHistoryModel payment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Paid On : ',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Mode : ',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Status : ',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Reward : ',
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff757575),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          payment.date.toDDMMMYYYY(),
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          payment.mode,
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          payment.status,
                          style: TextUtils.poppins(
                            const TextStyle(
                              color: Color(0xff888888),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/coins.svg',
                              width: 12,
                              height: 12,
                            ),
                            Text(
                              payment.amount,
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Txn Ref No : ',
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: Color(0xff757575),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      payment.txnRef,
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: Color(0xff888888),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Amount Paid : ',
                      style: TextUtils.poppins(
                        const TextStyle(
                          color: Color(0xff757575),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      '${StringConstants.rupeeSymbol}${payment.amount}',
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
