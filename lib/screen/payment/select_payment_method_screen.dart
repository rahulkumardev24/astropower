import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../helper/my_dialog.dart';

class SelectPaymentMethodScreen extends StatefulWidget {
  final int amount;
  final String? cashBackAmount;
  final String dialogTitle;
  const SelectPaymentMethodScreen({
    super.key,
    required this.amount,
    this.cashBackAmount,
    required this.dialogTitle,
  });

  @override
  State<SelectPaymentMethodScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<SelectPaymentMethodScreen> {
  late Razorpay _razorpay;
  String? _selectedUpiApp;
  String? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MyDialog.offerDialog(context: context, title: widget.dialogTitle);
    });
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.message}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("External Wallet Selected: ${response.walletName}"),
      ),
    );
  }

  void _openCheckout() {
    double gst = widget.amount * 0.18;
    double totalAmount = widget.amount + gst;

    // Initialize the options map with required fields
    Map<String, dynamic> options = {
      'key': 'rzp_live_e4tQB3fHe9N7Ww',
      // Amount in paise
      'amount': (totalAmount.round() * 100),
      'name': 'Astropower Recharge',
      'description': 'Wallet Top-up',
      'prefill': {
        'contact': '7970989057',
        'email': 'rkrahulroy151617@hmail.com',
      },
      'theme': {'color': '#FF4081'},
    };

    // Handle UPI app selection
    if (_selectedUpiApp != null) {
      options['method'] = 'upi';
      options['upi'] = {'app': _selectedUpiApp!.toLowerCase()};
    }
    // Handle other payment methods
    else if (_selectedPaymentMethod != null) {
      options['method'] = _selectedPaymentMethod;
      if (_selectedPaymentMethod == 'wallet') {
        // Specify wallet if needed, e.g., 'paytm' for Paytm wallet
        options['wallet'] = 'paytm'; // Adjust based on supported wallets
      }
    }

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error initiating payment: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    double gst = widget.amount * 0.18;
    double total = widget.amount + gst;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Payment Information",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recharge Amount",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text("₹ ${widget.amount}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("GST (18%)"),
                Text("₹${gst.toStringAsFixed(0)}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Payable Amount",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "₹${total.toStringAsFixed(0)}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            const Text(
              "Pay with UPI apps",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _upiOption(
                  imagePath: "lib/assets/image/google_pay_logo.png",
                  title: "GPay",
                  method: "gpay",
                  size: size,
                ),
                SizedBox(width: size.width * 0.05),
                _upiOption(
                  imagePath: "lib/assets/image/paytm_logo.png",
                  title: "Paytm",
                  method: "paytm",
                  size: size,
                ),
                SizedBox(width: size.width * 0.05),
                _upiOption(
                  imagePath: "lib/assets/image/phone_pay_logo.png",
                  title: "PhonePe",
                  method: "phonepe",
                  size: size,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1),
            const SizedBox(height: 20),
            const Text(
              "Other Payment Methods",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _paymentMethodTile(
              imagePath: "lib/assets/image/Paytm_logo_.png",
              title: "UPI",
              method: "upi",
            ),
            _paymentMethodTile(
              imagePath: "lib/assets/image/master_card.png",
              title: "Credit/Debit Card",
              method: "card",
            ),
            _paymentMethodTile(
              imagePath: "lib/assets/image/bank.png",
              title: "Net Banking",
              method: "netbanking",
            ),
            _paymentMethodTile(
              imagePath: "lib/assets/image/wallet_my.png",
              title: "Wallets",
              method: "wallet",
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                Icon(Icons.verified, color: Colors.green, size: 16),
                SizedBox(width: 5),
                Text(
                  "Secured by Trusted Indian Banks",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _openCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: const Text(
                "Proceed to pay",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _upiOption({
    required String imagePath,
    required String title,
    required String method,
    required Size size,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedUpiApp = method;
          _selectedPaymentMethod = null;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color:
                _selectedUpiApp == method
                    ? Colors.pinkAccent
                    : Colors.transparent,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
                width: size.height * 0.06,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(imagePath),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodTile({
    required String imagePath,
    required String title,
    required String method,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(imagePath, width: 30),
      title: Text(title),
      trailing: Icon(
        Icons.verified_user_outlined,
        color:
            _selectedPaymentMethod == method
                ? Colors.pinkAccent
                : Colors.black26,
      ),
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method;
          _selectedUpiApp = null;
        });
      },
    );
  }
}
