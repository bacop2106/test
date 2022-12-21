import 'package:flutter/material.dart';
import 'package:testcarmarket/navigatorbar/screena.dart';
import '../src/blocs/auth_blocs.dart';

class SignUpRoute extends StatefulWidget {
  const SignUpRoute({super.key});

  @override
  State<SignUpRoute> createState() => _SignUpRouteState();
}

class _SignUpRouteState extends State<SignUpRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUp());
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // AuthBloc authBloc = new AuthBloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();

  var _emailErr = "Email không hợp lệ";
  var _passErr = "Mật khẩu không hợp lệ";
  var _phoneErr = "số điện thoại k hợp lệ";
  var _nameErr = "Tên không phù hợp";


  var _emailInvalid = false;
  var _passInvalid = false;
  var _phoneInvalid = false;
  var _nameInvalid = false;
  // @override
  // void dispose() {
  //   authBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                width: 70,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/icons8-left-96.png'),
                ),
              ),
              const Expanded(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            errorText: _emailInvalid ? _emailErr : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                Container(height: 20),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                        controller: _passController,
                        decoration: InputDecoration(
                            hintText: 'Passworld',
                            errorText: _passInvalid ? _passErr : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child:TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: ' Full name',
                            errorText: _nameInvalid ? _nameErr : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                Container(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Phone Number',
                            errorText: _phoneInvalid ? _phoneErr : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16))),
                      ),
                    ),
                Container(height: 250),
                Container(
                  height: 100,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: onSigninClicked1,
                    child: const Text(
                      'SIGN UP',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
  void onSigninClicked1() {
    setState(() {
      if (_emailController.text.length <6 || !_emailController.text.contains("@")) {
        _emailInvalid = true;
      }else {
        _emailInvalid = false;
      }
      if (_passController.text.length < 6 || _passController.text.length > 25) {
        _passInvalid = true;
      }else {
        _passInvalid = false;
      }
      if (_phoneController.text.length < 8 || _phoneController.text.length > 13) {
        _phoneInvalid = true;
      }else {
        _phoneInvalid = false;
      }
      if (_nameController.text.length < 4) {
        _nameInvalid = true;
      }else {
        _nameInvalid = false;
      }
      if (!_emailInvalid && !_passInvalid && !_nameInvalid && !_phoneInvalid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ScreenA()),
        );
      }
      // var isValid1 = authBloc.isValid(_nameController.text, _passController.text, _phoneController.text, _emailController.text);
      // // if (authBloc.isValid1(_emailController.text, _phoneController.text, _passController.text, _nameController.text)) {
      // //   Navigator.push(
      // //     context,
      // //     MaterialPageRoute(builder: (context) => const ScreenA()),
      // //   );
      // // }
    });
  }
}
