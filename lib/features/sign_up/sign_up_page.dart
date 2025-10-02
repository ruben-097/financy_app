import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

//class SignUpPage extends StatelessWidget {
//const SignUpPage({super.key});
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //get OutlineInputBorder => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Center(
                child: Text(
                  'Start Saving\nYour Money',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.purpleText,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(child: Image.asset('assets/images/signup.png')),
              SizedBox(height: 16),
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
                        controller: _nameController,
                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "name".toUpperCase(),
                          labelStyle: TextStyle(
                            color: AppColors.darkgreyText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'empty',
                          hintStyle: TextStyle(fontSize: 12),
                          border: OutlineInputBorder(),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // se quiser cantos arredondados
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
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "email".toUpperCase(),
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
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // se quiser cantos arredondados
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
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        obscureText: _obscurePassword,
                        controller: _passwordController,
                        maxLength: 8,

                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),

                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "Password".toUpperCase(),
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
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.purpleText,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                                // _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),

                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // se quiser cantos arredondados
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
                            return 'Password must be at least 6 characters long';
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

                      SizedBox(height: 16),
                      TextFormField(
                        controller: _confirmPasswordController,

                        obscureText: _obscureConfirmPassword,
                        maxLength: 8,
                        style: TextStyle(
                          color: AppColors.purpleText,
                          fontSize: 16,
                        ),

                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: "confirm password".toUpperCase(),
                          labelStyle: TextStyle(
                            color: AppColors.darkgreyText,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: '❔❔❔❔❔❔❔',
                          hintStyle: TextStyle(fontSize: 10),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.purpleText,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                                // _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),

                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.purpleText,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ), // se quiser cantos arredondados
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
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),

                child: Ink(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.gradientPurple2,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    onTap: () {},
                    // Handle button tap},
                    child: Container(
                      alignment: Alignment.center,
                      height: 56.0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account?',
                    style: TextStyle(
                      color: AppColors.greyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: Text(
                      'Log In',
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
            ],
          ),
        ),
      ),
    );
  }
}
