// For SignIn BLoc

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:my_learnings/Bloc/InternetBloc/SignInBloc/Events/SignInEvent.dart";
import "package:my_learnings/Bloc/InternetBloc/SignInBloc/SignInBloc.dart";
import "package:my_learnings/Bloc/InternetBloc/SignInBloc/States/SignInState.dart";
import "package:my_learnings/Widgets/BoldText.dart";

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _email,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context)
                        .add(ValidateEvent(_email.text, _password.text));
                  },
                  decoration: InputDecoration(label: BoldText(text: "Email")),
                ),
                TextFormField(
                  controller: _password,
                  onChanged: (value) {
                    BlocProvider.of<SignInBloc>(context)
                        .add(ValidateEvent(_email.text, _password.text));
                  },
                  decoration:
                      InputDecoration(label: BoldText(text: "Password")),
                ),
                SizedBox(
                  height: 10,
                ),
                state is ErrorState
                    ? Row(
                        children: [
                          BoldText(
                            text: state.Error,
                            color: Colors.red,
                            size: 15,
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                    color: state is ValidState
                        ? Colors.blue
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                    child: BoldText(text: "Submit"),
                    onPressed: () {
                      if (state is ValidState) {
                        BlocProvider.of<SignInBloc>(context)
                            .add(SubmitEvent(_email.text, _password.text));
                      }
                    }),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                state is LoadingState
                    ? CircularProgressIndicator()
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
