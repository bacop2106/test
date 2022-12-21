
import 'package:flutter/material.dart';
import 'package:testcarmarket/src/blocs/login_blocs.dart';
import 'const/string.dart';
import 'login/signup.dart';
import 'navigatorbar/screena.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc bloc = new LoginBloc();

  bool _isHidden = true;
  bool _value = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/images/login2.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const Text(
              loginto,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              child: StreamBuilder(
                stream: bloc.usernameStream,
                builder: (context, snapshot) => TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: hintemail,
                      errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              )),
          Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              child: StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) => TextField(
                  obscureText: _isHidden,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: hintpassword,
                    errorText:
                    snapshot.hasError ? snapshot.error.toString() : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                      child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),
              )),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _value,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                onChanged: (value) {
                  setState(() {
                    _value = value!;
                  });
                },
                activeColor: Colors.black,
              ),
              const Text(rememberme)
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              onPressed: onSigninClicked,
              child: const Text(singin),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  forgotpassword,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: const <Widget>[
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              Text(
                orcontinue,
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-facebook-96.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-google-96.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Image.asset('assets/images/icons8-apple-logo-60.png'),
                  iconSize: 50,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          _buildSignUp('Đăng ký', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpRoute()),
            );
          })
        ],
      ),
    );
  }

  void onSigninClicked() {
    setState(() {
      if (bloc.isValidInfo(_nameController.text, _passwordController.text)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScreenA()),
        );
      }
    });
  }

  Widget _buildSignUp(String title, VoidCallback callbackSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: haveanaccount,
            style: DefaultTextStyle.of(context).style,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: callbackSeeAll,
            child: const Text(
              'SIGN UP',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
