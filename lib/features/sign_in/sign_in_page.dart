import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:financy_app/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: 12,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 140),
              Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: AppColors.purpleText,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(child: Image.asset('assets/images/log.png')),

              SizedBox(height: 40),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),

                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'email'.toUpperCase(),
                          labelStyle: TextStyle(
                            color: AppColors.darkgreyText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'name@email.com',
                          hintStyle: TextStyle(fontSize: 12),

                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 2,
                            ),
                          ),

                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.redColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Simple email validation
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,

                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'Password'.toUpperCase(),
                          labelStyle: TextStyle(
                            color: AppColors.darkgreyText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: '❔❔❔❔❔❔❔',
                          hintStyle: TextStyle(fontSize: 10),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.purpleText,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),

                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.redColor,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 8 characters';
                          }
                          // Verifica se contém pelo menos uma letra
                          if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                            return "Senha deve conter pelo menos uma letra";
                          }
                          // Verifica se contém pelo menos um número
                          if (!RegExp(r'\d').hasMatch(value)) {
                            return "Senha deve conter pelo menos um número";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Handle forgot password logic
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24),
                      Material(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: AppColors.gradientPurple2,
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                  final user = await FirebaseAuthService()
                                      .signInWithEmail(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text
                                            .trim(),
                                      );
                                  Navigator.pop(context);
                                  if (user != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Sign-in successful!'),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  }
                                  // Handle sign-in failure
                                } catch (e) {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())),
                                  );
                                }
                                //tr Process data.
                              }
                              // Handle sign-in logic
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 56.0,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                'Sign In',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 13),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do you not Have Account?',
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              // Navigate to Sign Up page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: AppColors.purpleText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
