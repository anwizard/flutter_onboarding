import 'dart:math';
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Onboarding', home: SplashScreen(), debugShowCheckedModeBanner: false));
  //runApp(const MaterialApp(title: 'Onboarding', home: MainScreen()));
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
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
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
          MaterialPageRoute(builder: (context) => const MainScreen()),
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

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rng = Random(42);
    const lanes = 8;
    final screen = MediaQuery.sizeOf(context);
    final laneHeight = screen.height / lanes;
    final squareSize = laneHeight * 0.7;

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 15, 
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.red, Colors.white, Colors.white, Colors.blue],
                            stops: [0.0, 0.4, 0.6, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.5),
                              spreadRadius: 10,
                              blurRadius: 15,
                              offset: Offset(0, 3), // Changes position of shadow (x, y)
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Container()),
                            Column(
                              children: [
                                //Expanded(flex: 1, child: Container()),
                                Expanded(
                                  child: SquaresArea()
                                ),
                                SizedBox(height: 50),
                                Text('Start Experiencing'),
                                Text('Your'),
                                Text('STUDENT LIFE'),
                                Text('NOW'),
                                SizedBox(height: 20)
                              ],
                            ),
                            Expanded(flex: 1, child: Container()),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  children: [
                    Text('Discover, manage and connect to your student life.'),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: Container()),
                        Expanded(
                          flex: 15, 
                          child: Column(
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (context) => PasswordScreen(),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 23.0),
                                  backgroundColor: Colors.blueGrey.shade900,
                                ),
                                child: Center(
                                  child: Text(
                                    'Continue with Email',
                                    style: TextStyle(
                                      color: Colors.white, // Using a basic material color
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 23.0),
                                  backgroundColor: Colors.grey.shade300,
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white, // Using a basic material color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(flex: 1, child: Container()),
                      ]
                    ),
                    SizedBox(height: 15),
                    Text("By continuing, you agree to Student Life's Terms of Use."),
                    SizedBox(height: 30),
                  ]
                )
              ),
            ]
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
              flex: 24, 
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
            flex: 24, 
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
                    color: Colors.white,
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

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

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
          child: PinInputScreen(
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

class PinInputScreen extends StatelessWidget {
  PinInputScreen({super.key, required this.onSubmit});

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
        Text('Enter Verification Code', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('We sent a verification code to your email', style: TextStyle(fontSize: 13)),
        Text('@smcl.edu.ph', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        SizedBox(height: 27), // Space Lower Small Text and TextField
        Row (
          children: <Widget>[
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 2, 
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'lorem ipsum',
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
  const ProfileCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                SizedBox(height: 30),
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
                    Expanded(flex: 4, child:Text('Your Name', textAlign: TextAlign.left)),
                    Expanded(flex: 3, child: Container()),
                  ]
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 24, 
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
                    Expanded(flex: 4, child:Text('Your Bio', textAlign: TextAlign.left)),
                    Expanded(flex: 3, child: Container()),
                  ]
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Expanded(flex: 2, child: Container()),
                    Expanded(
                      flex: 24, 
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
                    flex: 24, 
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

// ============================================================================================================
// Not screens

class SquaresArea extends StatelessWidget {
  const SquaresArea({super.key});

  @override
  Widget build(BuildContext context) {
    final rng = Random(42);
    const lanes = 3;

    return Container(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screen = MediaQuery.sizeOf(context);
          final width =
              constraints.hasBoundedWidth ? constraints.maxWidth : screen.width;
          final height =
              constraints.hasBoundedHeight ? constraints.maxHeight : screen.height;
          final laneHeight = height / lanes;
          final squareSize = laneHeight * 0.7;

          return SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                for (var i = 0; i < lanes; i++)
                  MovingSquare(
                    key: ValueKey(i),
                    imageUrl: 'https://picsum.photos/seed/$i/200',
                    size: squareSize,
                    top: i * laneHeight + (laneHeight - squareSize) / 2,
                    screenWidth: width,
                    duration: Duration(milliseconds: 3000 + rng.nextInt(7000)),
                    startAt: rng.nextDouble(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MovingSquare extends StatefulWidget {
  const MovingSquare({
    super.key,
    required this.imageUrl,
    required this.size,
    required this.top,
    required this.screenWidth,
    required this.duration,
    this.startAt = 0,
  });
 
  final String imageUrl;
  final double size;
  final double top;
  final double screenWidth;
  final Duration duration;
  final double startAt;
 
  @override
  State<MovingSquare> createState() => _MovingSquareState();
}
 
class _MovingSquareState extends State<MovingSquare>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
 
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the Ticker that fires once per frame
      duration: widget.duration,
    )
      ..value = widget.startAt // begin partway through the trip
      ..repeat(); // loop 0 -> 1 forever
  }
 
  @override
  void dispose() {
    _controller.dispose(); // always release the ticker
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: 0,
      child: AnimatedBuilder(
        animation: _controller,
        // Built once, reused every frame (it never changes).
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: widget.size,
            height: widget.size,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: Colors.primaries[widget.size.hashCode %
                    Colors.primaries.length],
              ),
            ),
          ),
        ),
        builder: (context, child) {
          // Map controller value 0..1 to an x position:
          // start just off the left edge, end just off the right edge.
          final x = lerpDouble(
            widget.screenWidth,
            -widget.size,
            _controller.value,
          )!;
          return Transform.translate(
            offset: Offset(x, 0),
            child: child,
          );
        },
      ),
    );
  }
}
