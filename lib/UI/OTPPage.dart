import 'package:flutter/material.dart';
import 'package:my_learnings/UI/HomePage2.dart';
import 'package:my_learnings/Widgets/BoldText.dart';
import 'package:my_learnings/Widgets/LightText.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: "OTP"),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 6,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  label: LightText(
                    text: "Please Enter OTP",
                    size: 14,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage2()));
                },
                child: LightText(text: "Confirm"))
          ],
        ),
      ),
    );
  }
}
