import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_astro/widgets/my_text_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String otpCode = "";
  Timer? _timer;
  int _start = 60;
  bool isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    setState(() {
      _start = 60;
      isResendEnabled = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          isResendEnabled = true;
        });
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_start ~/ 60).toString().padLeft(2, '0');
    final seconds = (_start % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Verify Phone")),

      /// --- Body --- ///
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "OTP Send to +91-${widget.number}",
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              SizedBox(height: size.height * 0.05),

              /// --- OTP BOX --- ///
              Pinput(
                length: 6,
                onCompleted: (pin) => otpCode = pin,
                showCursor: true,
                keyboardType: TextInputType.number,
                defaultPinTheme: PinTheme(
                  width: size.width * 0.13,
                  height: size.width * 0.13,
                  textStyle: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: size.width * 0.13,
                  height: size.width * 0.13,
                  textStyle: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: size.width * 0.13,
                  height: size.width * 0.13,
                  textStyle: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),

              SizedBox(
                width: size.width,
                child: MyTextButton(btnText: "SUBMIT", onPressed: () {}),
              ),

              SizedBox(height: size.height * 0.02),

              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Timer text
                    Text(
                      isResendEnabled
                          ? "Resend OTP Available"
                          : "Resend OTP Available in $timerText",
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),

                    const SizedBox(height: 8),

                    /// Resend OTP button
                    isResendEnabled
                        ? SizedBox(
                          width: size.width * 0.5,
                          child: MyTextButton(
                            btnText: "Resend OTP on SMS",
                            textSize: 14,
                            onPressed: () {
                              startTimer();
                            },
                          ),
                        )
                        : SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
