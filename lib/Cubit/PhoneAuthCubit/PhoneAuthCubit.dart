// ignore_for_file: unused_local_variable, unnecessary_null_comparison, unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_learnings/Cubit/PhoneAuthCubit/AuthState.dart';

class PhoneAuthCubit extends Cubit<AuthState> {
  // created the object/instance
  final FirebaseAuth _Auth = FirebaseAuth.instance;

  PhoneAuthCubit() : super(InitialState());

  // store the verificationID for laterUse
  String? ID = "";

  // send OTP on a specific number
  void sendOtp(String number) {
    _Auth.verifyPhoneNumber(

        //assign phone number

        phoneNumber: number,

        // code sent
        codeSent: (verificationId, forceResendingToken) {
          ID = verificationId;
          // emit the Appropiate state
          emit(CodeSentState());
        },
        // code verified - automatically without user input
        verificationCompleted: (phoneAuthCredential) {
          // emit the state accordingly
          emit(
              VerifiedState()); // confused about it... either we will use it or not

          // once otp is verified its obvious to SignIn towards the home page
          signIn(phoneAuthCredential);
        },
        // error occoured
        verificationFailed: (error) {
          // emit error state

          print("Errrrrrrrrrrrrr : " + error.toString());
          emit(ErrorState(error.toString()));
        },
        codeAutoRetrievalTimeout: (String valueID) {
          ID = valueID;
        });
  }

  // verify OTP either its correct or not
  void verifyOtp(String userInput) {
    // this _phoneAuthCredential will be used further as credential

    emit(LoadingState());

    PhoneAuthCredential _phoneAuthCredential = PhoneAuthProvider.credential(

        // Give it the ID

        verificationId: ID!,

        // Verify the user input with actual OTP

        smsCode: userInput);

    // lets use the _phoneAuthCredential and pass it to signIn Function

    signIn(_phoneAuthCredential);
  }

  // signIn User

  void signIn(PhoneAuthCredential __phoneAuthCredential) async {
    // on the basis of otp we got the _phoneAuthCredential

    // basically its a credential and with its help we will try to SigninWithCredential

    try {
      // we are using _userCredential becuse we need to check either _phoneAuthCredential credential is okay or not
      UserCredential _userCredential =
          await _Auth.signInWithCredential(__phoneAuthCredential);

      // After this we are signIn So We can emit the loggedIn State
      emit(LoggedInState());
    } on FirebaseAuthException catch (ex) {
      emit(ErrorState(ex.toString()));
    }
  }

  // signOut User
  void signOut() async {
    await _Auth.signOut();

    emit(LoggedOutState());
  }
}
