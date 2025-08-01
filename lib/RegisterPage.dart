import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:job/Dashboard.dart';
import 'package:job/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedCountryCode = '+91';
  final NameController = TextEditingController();
  final EmailController = TextEditingController();
  final PhoneController = TextEditingController(); // Added phone controller
  final PassController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Added form key
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form( // Wrapped in Form widget
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 180,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),

              // Company & Business Name
              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 20),
                controller: NameController,
                decoration: InputDecoration(
                    labelText: 'Company & Business Name',
                    labelStyle: TextStyle(color: Colors.black54,fontSize: 20),
                    hintText: 'Maan Store',
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38)
                    )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter company name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Email Address
              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 20),
                controller: EmailController,
                decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.black54,fontSize: 20),
                    hintText: 'MaanStore@gmail.com',
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38)
                    )
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Country Code Picker and Phone Number
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          selectedCountryCode = country.dialCode!;
                        });
                      },
                      initialSelection: 'IN',
                      favorite: ['+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black,fontSize: 20),
                        controller: PhoneController, // Added controller
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)
                          ),
                          labelStyle: TextStyle(color: Colors.black54,fontSize: 20),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          if (value.length != 10) {
                            return 'Phone must be 10 digits';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Password
              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 20),
                controller: PassController,
                obscureText: !isPasswordVisible,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black54,fontSize: 20),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be 6+ characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Register Button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle valid registration
                      print('Country Code: $selectedCountryCode');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Login Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpage()));
                    },
                    child: Text('Log In',style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}