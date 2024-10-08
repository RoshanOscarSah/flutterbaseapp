import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/widget/offline_snack.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbaseapp/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  FocusNode inputNode = FocusNode();

  String? otpCode;

  @override
  void initState() {
    FirebaseCrashlytics.instance.log("LoginPage");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // to open keyboard call this function;
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  loginTap(String token) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<LoginCubit>();
      cubit.login(phoneNumber: _phoneController.text, token: token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CusColor.kP100,
      body: PixelPerfect(
        scale: 0.90,
        initOpacity: 0,
        initBottom: 90,
        // assetPath: ImageAsset.kAImContactUsPage,
        child: ConnectivityWidget(
          offlineBanner: const OfflineSnack(),
          builder: (context, isOnline) => Skeletonizer(
            enabled: false,
            child: ListView(
              children: const [
                SizedBox(
                  height: 200,
                ),
                Text("Let' get your app done ...")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
