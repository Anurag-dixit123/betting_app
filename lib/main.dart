
import 'package:betting_app/gaming_history.dart';
import 'package:betting_app/password_screen.dart';
import 'package:betting_app/payment_history.dart';
import 'package:betting_app/topup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:betting_app/phone.dart';
import 'package:betting_app/verify.dart';
import 'package:betting_app/app_homescreen.dart';
import 'package:betting_app/login_screen.dart';
import 'package:betting_app/gaming_ui.dart';
import 'package:betting_app/withdrawal_screen.dart';
import 'package:betting_app/withdrawal_history.dart';
import 'package:betting_app/bank_details.dart';
import 'package:betting_app/referral_screen.dart';
import ' Forgot Password Screen/ForgotPassword_Screen.dart';
import ' Forgot Password Screen/New_Password_Screen.dart';
import ' Forgot Password Screen/Otp_Verification_Screen.dart';
import 'DepositScreen.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: 'home',
    routes: {
      'home': (context) => AuthScreen(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'login': (context) => LoginPage(),
      'app': (context) => HomePage(),
      'game': (context) => CalendarButtons(),
      'topup': (context) => AddMoneyScreen(),
      'transaction': (context) => Payment(),
      'withdraw': (context) => WithdrawMoneyScreen(),
      'history': (context) => WithdrawalHistory(),
      'bankdetails': (context) => BankDetails(),
      'referral': (context) => ReferralScreen(),
      'gamehistory': (context) => GameHistory(),
      'deposit': (context) => DepositScreen(),
      'forgotPassword': (context) => ForgotPasswordScreen(),
      'OtpVerification': (context) => OTPVerificationScreen(),
      'NewPassword': (context) => NewPasswordScreen(),



    },
  )
  );
}