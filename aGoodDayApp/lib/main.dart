import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:a_gooddayapp/SizeConfig.dart';
//import 'package:gtk_flutter/src/widgets.dart';
import 'package:a_gooddayapp/albums.dart';
import 'package:a_gooddayapp/artists.dart';
import 'package:a_gooddayapp/developer.dart';

import 'package:firebase_auth/firebase_auth.dart'; // new
import 'package:firebase_core/firebase_core.dart'; // new

import 'package:provider/provider.dart'; // new

import 'firebase_options.dart'; // new
import 'src/authentication.dart'; // new

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'A Good Day App',
              home: MusicHome(),
            );
          },
        );
      },
    );
  }
}

class MusicHome extends StatefulWidget {
  MusicHome({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MusicHomeState createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
// Add from here (login)
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: Consumer<ApplicationState>(
              builder: (context, appState, _) => Authentication(
                email: appState.email,
                loginState: appState.loginState,
                startLoginFlow: appState.startLoginFlow,
                verifyEmail: appState.verifyEmail,
                signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                cancelRegistration: appState.cancelRegistration,
                registerAccount: appState.registerAccount,
                signOut: appState.signOut,
              ),
            ),
          ),
          // to here

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: Text(
              "A Good Day App",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Nunito-Regular',
                  fontSize: 4.5 * SizeConfig.textMultiplier),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40.0),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.blue[900],
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "ALBUMS",
                      style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "ARTISTS",
                      style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "DEVELOPER",
                      style: TextStyle(
                          fontSize: 2 * SizeConfig.textMultiplier,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                  controller: tabController,
                  children: <Widget>[Albums(), Artists(), Developer()]),
            ),
          )
        ],
      ),
    );
  }
}

//ApplicationState login

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
