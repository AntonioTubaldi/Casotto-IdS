import 'package:casotto/models/Ruolo.dart';
import 'package:casotto/models/Utente.dart';
import 'package:casotto/services/UtenteService.dart';
import 'package:casotto/views/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginUtenteView extends StatefulWidget {
  const LoginUtenteView({Key? key}) : super(key: key);

  static const String routeName = "LoginUtente";

  @override
  State<LoginUtenteView> createState() => _LoginUtenteViewState();
}

class _LoginUtenteViewState extends State<LoginUtenteView> {
  UtenteService utenteService = new UtenteService();
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "Casotto utenti",
      onLogin: (LoginData data) async {
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: data.name, password: data.password);
          if (credential != null) {
            return null;
          } else {
            return "Errore generico nelle credenziali";
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            return "Nessun utente trovato per la mail ${data.name}";
          } else if (e.code == 'wrong-password') {
            return "Password errata";
          }
        }
      },
      onSignup: (SignupData data) async {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: data.name!,
            password: data.password!,
          );

          await credential.user!.updateDisplayName(
              "${data.additionalSignupData!["name"]} ${data.additionalSignupData!["surname"]}");

          if (credential != null) {
            this.utenteService.createUtente(
                credential.user!.uid,
                data.additionalSignupData!["name"]!,
                data.additionalSignupData!["surname"]!,
                Ruolo.REGISTRATO);
            return null;
          } else {
            return "Errore generico nelle credenziali";
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            return "Password troppo debole";
          } else if (e.code == 'email-already-in-use') {
            return "Utente già esistente per la mail ${data.name}";
          }
        }
        print(data.toString());
      },
      additionalSignupFields: [
        UserFormField(
          keyName: "name",
          displayName: "Nome",
        ),
        UserFormField(
          keyName: "surname",
          displayName: "Cognome",
        ),
      ],
      loginAfterSignUp: true,
      hideForgotPasswordButton: true,
      onRecoverPassword: (String name) {
        return null;
      },
      onSubmitAnimationCompleted: () {
        Navigator.pushReplacementNamed(
          context,
          HomePage.routeName,
        );
      },
    );
  }
}
