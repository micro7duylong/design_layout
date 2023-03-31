import 'package:design_layout/view/appple_health.dart';
import 'package:design_layout/view/validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  final String title;

  const Register({super.key, required this.title});

  @override
  State<Register> createState() {
    return _RegisterState();
  }
}

// late TextEditingController _usernamecontroler = TextEditingController();
// late TextEditingController email = TextEditingController();
// late TextEditingController _passwordController = TextEditingController();
// late TextEditingController _confirmpasswordcontroler = TextEditingController();

class _RegisterState extends State<Register> {
  late String title;
  late bool isTermChecked;
  late bool isReceiveMessChecked;
  bool isPasswordShowing = false;
  bool isConfirmPasswordShowing = false;
  bool isPasswordValidated = false;
  String username = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  late bool _isButtonDisabled;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    isTermChecked = false;
    isReceiveMessChecked = false;
    _isButtonDisabled = false;
  }

  final textFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: ListView(
            children: [
              _buldtitle(),
              const SizedBox(
                height: 30,
              ),
              _buildUsernamInput(),
              _buildEmailInput(),
              _buildPasswordInput(),
              _buildConfirmPasswordInput(),
              const SizedBox(
                height: 20,
              ),
              _buildPasswordCodition(),
              const SizedBox(
                height: 10,
              ),
              _buildTermpAndControllerCondition(),
              const Spacer(),
              _buildRegisterButton(),
              _buildLoginOption(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buldtitle() {
    return Center(
        child: Title(
      color: Colors.white,
      child: Text(
        this.title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    ));
  }

  Widget _buildRegisterButton() {
    return Container(
      child: SizedBox(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppleHealth()),
            );
          },
          child: Text("Register Now"),
        ),
      ),
    );
  }

  Widget _buildLoginOption() {
    return Container(
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: const [
            Text(
              "Already have an account?",
              style:
                  TextStyle(fontWeight: FontWeight.w200, color: Colors.black),
            ),
            Text(' Log in',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple)),
          ],
        ),
      ),
    );
  }

  Widget _buildUsernamInput() {
    return TextFormField(
      //  controller: _usernamecontroler,
      decoration: new InputDecoration(hintText: '@User Name'),
      onChanged: (value) {
        username = value;
      },
      //  style: TextStyle(),
    );
  }

  Widget _buildEmailInput() {
    return TextFormField(
      // controller: email,
      onChanged: (value) {
        email = value;
      },
      decoration: new InputDecoration(
        hintText: 'E-mail',
      ),

      //  style: TextStyle(),
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        // controller: _passwordController,
        focusNode: textFieldFocusNode,
        obscureText: isPasswordShowing,
        onChanged: (value) {
          password = value;
        },
        // validator: (value) {
        //   password = value!;
        //   emailValid(value);
        // },
        decoration: InputDecoration(
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isPasswordShowing = !isPasswordShowing;
              });
            },
            icon: Icon(
              isPasswordShowing ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ));
  }

  Widget _buildConfirmPasswordInput() {
    return TextFormField(
      // controller: _confirmpasswordcontroler,
      obscureText: isConfirmPasswordShowing,
      onChanged: (value) {
        confirmPassword = value;
      },
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isConfirmPasswordShowing = !isConfirmPasswordShowing;
            });
          },
          icon: Icon(
            isConfirmPasswordShowing ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordCodition() {
    return Container(
      alignment: Alignment.centerRight,
      width: 200,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('3/8 characters required -'),
            Text('Add symbols and numbers -'),
            Text('Add uppercases -')
          ]),
    );
  }

  Widget _buildTermpAndControllerCondition() {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(children: [
        Row(
          children: [
            Checkbox(
              value: isTermChecked,
              onChanged: (bool? value) {
                setState(() {
                  isTermChecked = value!;
                });
              },
            ),
            const Expanded(
              child: Text(
                'By signing up you accept our terms and conditions and privacy policy',
                maxLines: 3,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Checkbox(
              value: isReceiveMessChecked,
              onChanged: (value) {
                setState(() {
                  isReceiveMessChecked = value!;
                });
                print('$isReceiveMessChecked');
              },
            ),
            const Expanded(
              child: Text(
                'I agree to receive promotional messages and updates by email, text notifications, phone and post from LIV3LY.',
                maxLines: 3,
              ),
            )
          ],
        )
      ]),
    );
  }
}
