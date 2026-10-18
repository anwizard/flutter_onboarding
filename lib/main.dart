import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Onboarding', home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen2()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200,
              height: 200,
              //fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<SplashScreen2> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SplashScreen3()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/1.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreenState3();
}

class _SplashScreenState3 extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PasswordScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
          ),
        ),
        body: Center(
          child: TextFieldInputScreen(
            onSubmit: (text) {
              print(text);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ProfileCompletionScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
          ),
        ),
        body: Center(
          child: TextFieldInputScreen(
            onSubmit: (text) {
              print(text);
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => ProfileCompletionScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class TextFieldInputScreen extends StatelessWidget {
  TextFieldInputScreen({super.key, required this.onSubmit});

  final void Function(String) onSubmit;

  final TextEditingController _textEditingController = TextEditingController();

  void _onSubmit() {
    onSubmit(_textEditingController.text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(6), 
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Icon(Icons.mail, size: 50),
        ),
        SizedBox(height: 30), // Space between Icon and Upper Big Text
        Text('Continue with Email', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Sign in with your School Email', style: TextStyle(fontSize: 13)),
        SizedBox(height: 27), // Space Lower Small Text and TextField
        Row (
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2, 
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'School Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                  ),
                ),
                controller: _textEditingController,
                autofocus: true,
                onSubmitted: (input) {
                  _onSubmit();
                },
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
        //SizedBox(height: 150), // Space between TextField and Submit Button
        Expanded(flex: 8, child: Container()),
        Row (
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
            flex: 2, 
            child: TextButton(
              onPressed: () {
                _onSubmit();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 23.0),
                backgroundColor: Colors.blueGrey.shade900,
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white, // Using a basic material color
                  ),
                ),
              ),
            ),
            ), 
            Expanded(flex: 2, child: Container()),
          ]
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  } 
}

// Profile Screen
class ProfileCompletionScreen extends StatelessWidget {
  ProfileCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.center,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.red, Colors.white, Colors.white, Colors.blue],
              stops: [0.0, 0.4, 0.6, 1.0],
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                // The pfp icon
                Container(
                  padding: const EdgeInsets.all(6), 
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/placeholder.JPG'),
                  )
                ),

                SizedBox(height: 10),

                Text('Complete your Profile!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('Tell us and everyone, who you are!', style: TextStyle(fontSize: 13)),

                SizedBox(height: 30),

                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    Expanded(flex: 2, child: Container()),
                    Expanded(flex: 4, child:Text('Your Name', textAlign: TextAlign.left)),
                    Expanded(flex: 3, child: Container()),
                  ]
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 3, 
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    Expanded(flex: 2, child: Container()),
                    Expanded(flex: 4, child:Text('Your Bio', textAlign: TextAlign.left)),
                    Expanded(flex: 3, child: Container()),
                  ]
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 3, 
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 6, 
                        decoration: InputDecoration(
                          hintText: 'Share all about yourself!',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                Expanded(flex: 8, child: Container()),
                Row (
                  children: <Widget>[
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                    flex: 2, 
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 23.0),
                        backgroundColor: Colors.blueGrey.shade900,
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white, // Using a basic material color
                          ),
                        ),
                      ),
                    ),
                    ), 
                    Expanded(flex: 2, child: Container()),
                  ]
                ),
                Expanded(flex: 1, child: Container()),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
