import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rawh/code_screen/cubit/code_screen_cubit.dart';
import 'package:rawh/confirm_password/cubit/confirm_password_cubit.dart';
import 'package:rawh/forget_password/cubit/forgetpassword_cubit.dart';
import 'package:rawh/sound/sound_intro.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => codeCubit()),
        BlocProvider(create: (context) => ConfirmPasswordCubit()),
        BlocProvider(create: (context) => ForgetPasswordCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoundIntro(),
    );
  }
}
