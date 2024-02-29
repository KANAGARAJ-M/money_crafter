import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_crafter/AppList/MetroopinionDes.dart';
import 'package:money_crafter/AppList/ShareMediaDes.dart';
import 'package:money_crafter/AppList/under25des.dart';
import 'package:money_crafter/models/infocardModel.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Have an account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordVisible = true;

  void _login(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // User logged in successfully
      print('User logged in: ${userCredential.user!.uid}');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(email: _emailController.text),
        ),
      );
    } catch (e) {
      // Handle login errors
      print('Failed to log in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
              // obscureText: true,
              obscureText: passwordVisible,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  String _errorText = '';
  bool passwordVisible = true;
  TextEditingController conpasswordController = TextEditingController();
  bool conpasswordVisible = true;

  void _register(BuildContext context) async {
    try {
      // Check if the username is already taken
      bool isUsernameTaken = await _isUsernameTaken(_usernameController.text);
      if (isUsernameTaken) {
        setState(() {
          _errorText = 'Username is already taken';
        });
        return;
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Generate a unique user ID
      String userId = userCredential.user!.uid;
      // Store additional user data in Firestore (if needed)
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'email': _emailController.text,
        'username': _usernameController.text,
        // Add more user data here if needed
      });

      // User registered successfully, redirect to login
      print('User registered: $userId');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Handle registration errors
      print('Failed to register: $e');
    }
  }

  Future<bool> _isUsernameTaken(String username) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    return documents.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _passwordController,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off)),
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
              // obscureText: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
              controller: conpasswordController,
              obscureText: conpasswordVisible,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        conpasswordVisible = !conpasswordVisible;
                      });
                    },
                    icon: Icon(conpasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off)),
                label: Text('Confirm Password'),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.brown),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            if (_errorText.isNotEmpty)
              Text(
                _errorText,
                style: TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String email;

  // HomePage(this.email);
  HomePage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Crafter - $email'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.upload))],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              InfoCardModel(
                refappLink:
                    'https://kanagaraj-m.github.io/assets/money_crafter/Metroopinion.jpg',
                appname: 'Metroopinion',
                description: 'Paid surveys: Earn money online, Work From Home Get up to \$3.5 for each survey',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MetroopinionDes()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              InfoCardModel(
                refappLink:
                    'https://kanagaraj-m.github.io/assets/apps/share_medi_logo.png',
                appname: 'ShareMedia',
                description: 'Share Your Photos and Earn Money',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShareMediaDes()),
                  );
                },
              ),
              SizedBox(
                height: 5,
              ),
              InfoCardModel(
                refappLink:
                    'https://play-lh.googleusercontent.com/a5hJazrTzd7HrPZpPLiZlSQYOMHu7GPwfFLS5EfuuQdbM3Hh5Lzk0rJhm21l-VqoLEY=w240-h480-rw',
                appname: 'Under 25',
                description:
                    'Students can now take part in missions and earn money instantly, while also unlocking access to apply to giveaways and jobs! For those of you who want to kick-start your own communities, creation of spaces has been enabled as well.',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Under25AppDes()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
