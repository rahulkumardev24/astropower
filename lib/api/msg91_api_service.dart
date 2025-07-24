import 'dart:convert';
import 'package:http/http.dart' as http;

class Msg91Service {
  static const String authKey = '456463Afx0ruGsT686666cbP1';
  static const String otpSendUrl = 'https://control.msg91.com/api/v5/otp';
  static const String otpVerifyUrl =
      'https://control.msg91.com/api/v5/otp/verify';
  static const String templateId = '68639178d6fc053d035c2e02';

  /// Send OTP
  static Future<bool> sendOtp(String mobileNumber) async {
    final Uri url = Uri.parse(otpSendUrl);

    final response = await http.post(
      url,
      headers: {'authkey': authKey, 'Content-Type': 'application/json'},
      body: jsonEncode({
        'mobile': '91$mobileNumber',
        'template_id': templateId,
      }),
    );

    print('Send OTP Response: ${response.body}');
    return response.statusCode == 200;
  }

  /// Verify OTP
  static Future<bool> verifyOtp(String mobileNumber, String otp) async {
    final Uri url = Uri.parse(otpVerifyUrl);

    final response = await http.post(
      url,
      headers: {'authkey': authKey, 'Content-Type': 'application/json'},
      body: jsonEncode({'mobile': '91$mobileNumber', 'otp': otp}),
    );

    print('Verify OTP Response: ${response.body}');
    final resBody = jsonDecode(response.body);
    return resBody["message"] == "OTP verified success";
  }
}
