// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learnings/Cubit/PhoneAuthCubit/AuthState.dart';
import 'package:my_learnings/Cubit/PhoneAuthCubit/PhoneAuthCubit.dart';
import 'package:my_learnings/UI/OTPPage.dart';
import 'package:my_learnings/Widgets/BoldText.dart';
import 'package:my_learnings/Widgets/LightText.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BoldText(text: "Login"),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controller,
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      label: LightText(
                        text: "Please Enter Phone Number",
                        size: 14,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
                ElevatedButton(
                    onPressed: () {
                      String Number = "+92" + _controller.text;
                      print(Number);

                      BlocProvider.of<PhoneAuthCubit>(context).sendOtp(Number);

                      print("State is ....... " + state.toString());
                      print(Number);

                      if (State is ErrorState) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OTPPage()));
                      }
                    },
                    child: LightText(text: "Send OTP"))
              ],
            ),
          ),
        );
      },
    );
  }
}
