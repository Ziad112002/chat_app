
import 'package:chat_app/core/utils/theme/app_theme.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/features/auth/presentation/login/view/login_view.dart';
import 'package:chat_app/features/auth/presentation/register/view/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const ChatApp());
}
class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id:(context)=>   const LoginView(),
        RegisterView.id:(context)=>   const RegisterView(),
        ChatPage.id:(context)=>  ChatPage()
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute:RegisterView.id,
    );
  }
}
