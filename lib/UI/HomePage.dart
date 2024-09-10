import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learnings/Cubit/InternetCubit/InternetCubit.dart';
import 'package:my_learnings/Widgets/BoldText.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// For Internet Bloc and Cubit
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<InternetCubit, InternetCubitState>(
              listener: (context, state) {
                if (state == InternetCubitState.Lost) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.red,
                        content: BoldText(
                          text: "Internet Lost!",
                          color: Colors.white,
                        )),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.green,
                        content: BoldText(
                          text: "Internet Connected!",
                          color: Colors.white,
                        )),
                  );
                }
              },
              builder: (context, state) {
                return state == InternetCubitState.Gained
                    ? BoldText(text: "Welcome")
                    : CircularPercentIndicator(
                        radius: 80,
                        animationDuration: 10000,
                        percent: 0.5,
                        backgroundColor: Colors.deepPurple.shade100,
                        progressColor: Colors.deepPurple,
                        lineWidth: 10,
                        animation: true,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: BoldText(text: "50%"),
                      );
              },
            ),
          )

          // Center(
          //     child: BlocConsumer<InternetBloc, InternetState>(
          //   listener: (context, state) {
          //     if (state is InternetLostState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //             backgroundColor: Colors.red,
          //             content: BoldText(
          //               text: "Internet Not Connected!",
          //               color: Colors.white,
          //             )),
          //       );
          //     } else if (state is InternetGainedState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //             backgroundColor: Colors.green,
          //             content: BoldText(
          //               text: "Internet Connected!",
          //             )),
          //       );
          //     }
          //   },
          //   builder: (context, state) {
          //     if (state is InternetLostState) {
          //       return BoldText(text: "Not Connected!");
          //     } else if (state is InternetGainedState) {
          //       return BoldText(text: "Connected!");
          //     } else {
          //       return BoldText(text: "Loading...");
          //     }
          //   },
          // )),
        ],
      ),
    );
  }
}
