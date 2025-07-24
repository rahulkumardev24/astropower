import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_astro/screen/payment/payment_info_screen.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({super.key});

  @override
  State<AddMoneyScreen> createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  /// recharge option data
  final List<Map<String, dynamic>> rechargeOptions = [
    {"amount": 50, "extra": "Get 2% Extra"},
    {"amount": 100, "extra": "Get 2% Extra"},
    {"amount": 200, "extra": "Get 2% Extra"},
    {"amount": 500, "extra": "Get 2% Extra"},
    {"amount": 1000, "extra": "Get 2% Extra"},
    {"amount": 2000, "extra": "Get 2% Extra"},
    {"amount": 3000, "extra": "Get 10% Extra"},
    {"amount": 4000, "extra": "Get 11% Extra"},
    {"amount": 5000, "extra": "Get 15% Extra"},
    {"amount": 10000, "extra": "Get 15% Extra"},
    {"amount": 20000, "extra": "Get 15% Extra"},
    {"amount": 50000, "extra": "Get 20% Extra"},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        /// aapBar
        appBar: AppBar(title: Text("Add Money to wallet"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Available Balance", style: TextStyle(fontSize: 21)),
              Row(
                children: [
                  Icon(Icons.currency_rupee_rounded, size: 27),
                  Text(
                    "1000",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: rechargeOptions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 5 / 4.5,
                ),
                itemBuilder: (context, index) {
                  final amountOptions = rechargeOptions[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => PaymentInfoScreen(
                                amount: amountOptions["amount"],
                              ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              /// icon
                              Icon(Icons.currency_rupee_rounded),

                              /// amount
                              Text(
                                "${amountOptions["amount"]}",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,

                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green.withAlpha(40),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(11),
                                  bottomLeft: Radius.circular(11),
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    "${amountOptions['extra']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
