import 'package:flutter/material.dart';
import 'package:investcraftpartner/screens/authScreens/authProvider.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AuthProvider ap = context.watch<AuthProvider>();
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             ElevatedButton(onPressed: (){
               ap.deleteUserData(context);
             }, child: Text("Logout"),)
          ],
        ),
      ),
    );
  }
}
