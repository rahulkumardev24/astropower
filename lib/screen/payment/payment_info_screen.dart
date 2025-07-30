import 'package:flutter/material.dart';
import 'package:my_astro/screen/payment/select_payment_method_screen.dart';

class PaymentInfoScreen extends StatefulWidget {
  final int amount;
  const PaymentInfoScreen({super.key, required this.amount});

  @override
  State<PaymentInfoScreen> createState() => _PaymentInfoScreenState();
}

class _PaymentInfoScreenState extends State<PaymentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    /// Gst Find
    double gst = (widget.amount * 0.18).roundToDouble();

    /// Total Payable amount
    double totalPayable = widget.amount + gst;

    /// cashback amount
    double cashback = _calculateCashback(widget.amount);

    /// final amount
    double finalAmount = widget.amount + cashback;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      /// appbar
      appBar: AppBar(title: Text("Payment Information"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Payment Details Box
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10),
                    _infoData(
                      title: "Total Amount",
                      value: "₹ ${widget.amount.toStringAsFixed(1)}",
                      fontWeight: FontWeight.normal,
                    ),
                    _infoData(
                      title: "GST 18%",
                      value: "₹ ${gst.toStringAsFixed(1)}",
                      fontWeight: FontWeight.normal,
                    ),
                    _infoData(
                      title: "Total Payable Amount",
                      value: "₹ ${totalPayable.toStringAsFixed(2)}",
                      fontWeight: FontWeight.w900,
                    ),
                    _infoData(
                      title: "Cashback",
                      value: "₹ ${cashback.toStringAsFixed(1)}",
                      fontWeight: FontWeight.w900,
                    ),
                    _infoData(
                      title: "After Cashback you will Get",
                      value: "₹ ${finalAmount.toStringAsFixed(2)}",
                      fontWeight: FontWeight.w900,
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green.shade300),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${_getExtraPercentage(widget.amount)} extra on recharge of ₹ ${widget.amount}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  "₹ ${cashback.toStringAsFixed(1)} Cashback in Astropower\nwallet with this recharge",
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.close, color: Colors.grey, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),

            /// Proceed Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SelectPaymentMethodScreen(
                            amount: widget.amount,
                            cashBackAmount: cashback.toString(),
                            dialogTitle:
                                "Get ₹$cashback extra cash on recharge of ${widget.amount}.",
                          ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "Proceed to Pay",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoData({
    required String title,
    required String value,
    required FontWeight fontWeight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: fontWeight)),
          Text(value, style: TextStyle(fontWeight: fontWeight)),
        ],
      ),
    );
  }

  double _calculateCashback(int amount) {
    if (amount >= 50000) return amount * 0.20;
    if (amount >= 10000) return amount * 0.15;
    if (amount >= 3000) return amount * 0.10;
    return amount * 0.02;
  }

  String _getExtraPercentage(int amount) {
    if (amount >= 50000) return "20%";
    if (amount >= 10000) return "15%";
    if (amount >= 3000) return "10%";
    return "2%";
  }
}
