// import 'package:flutter/material.dart';
// import 'package:loginsignup/home_page.dart';
// import 'forgot_password.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:loginsignup/config.dart';

// class MyLogin extends StatefulWidget {
//   const MyLogin({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyLoginState createState() => _MyLoginState();
// }

// class _MyLoginState extends State<MyLogin> {
//  // add at top of your _MyLoginState
// TextEditingController emailController = TextEditingController();
// TextEditingController passwordController = TextEditingController();
// bool isLoading = false;

// // replace your loginUser() with this
// Future<void> loginUser() async {
//   final email = emailController.text.trim();
//   final password = passwordController.text.trim();

//   if (email.isEmpty || password.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Please enter both email and password")),
//     );
//     return;
//   }

//   setState(() => isLoading = true);

//   final url = Uri.parse('${Config.baseUrl}/auth/login');

//   try {
//     final response = await http.post(
//       url,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"email": email, "password": password}),
//     );

//     print('LOGIN: statusCode=${response.statusCode}');
//     print('LOGIN: rawBody=${response.body}');

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       if (data['status'] == 'success') {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Login Successful!")),
//         );

//         // Navigate to home after small delay
//         Future.delayed(const Duration(milliseconds: 300), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const HomePage()),
//           );
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(data['message'] ?? 'Login failed')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Server error: ${response.statusCode}")),
//       );
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Network error: $e")),
//     );
//   } finally {
//     setState(() => isLoading = false);
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/login.png'),
//           fit: BoxFit.cover,
//         ),
//       ),

//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child: Text(
//                 'Welcome\nBack',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 33,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.5,
//                   right: 35,
//                   left: 35,
//                 ),
//                 child: Column(
//                   children: [
//                     TextField(
//                     controller: emailController,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white70,
//                     filled: true,
//                     hintText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   ),
//                   SizedBox(height: 30),
//                   TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white70,
//                     filled: true,
//                     hintText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   ),

//                     SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Color(0xff4c505b),
//                             fontSize: 27,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                        CircleAvatar(
//                         radius: 30,
//                         backgroundColor: const Color(0xff4c505b),
//                         child: isLoading
//                             ? const SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2.5,
//                                   color: Colors.white,
//                                 ),
//                               )
//                             : IconButton(
//                                 onPressed: loginUser,
//                                 icon: const Icon(Icons.arrow_forward, color: Colors.white),
//                               ),
//                           ),

//                       ],
//                     ),
//                     SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, 'register');
//                           },

//                           child: Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               fontSize: 18,
//                               color: Color(0xff4c505b),
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => MyForgotPassword(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'Fogot Password',
//                             style: TextStyle(
//                               decoration: TextDecoration.underline,
//                               fontSize: 18,
//                               color: Color(0xff4c505b),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 30),
// ElevatedButton(
//   onPressed: () {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Check button pressed")),
//     );
//   },
//   style: ElevatedButton.styleFrom(
//     backgroundColor: const Color(0xff4c505b),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//   ),
//   child: const Text(
//     "Check",
//     style: TextStyle(fontSize: 18, color: Colors.white),
//   ),
// ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:loginsignup/home_page.dart';
import 'forgot_password.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loginsignup/config.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  // Login Function
  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    setState(() => isLoading = true);

    final url = Uri.parse('${Config.baseUrl}/auth/login');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print('LOGIN: statusCode=${response.statusCode}');
      print('LOGIN: rawBody=${response.body}');

      Map<String, dynamic> responseData = {};
      try {
        responseData = jsonDecode(response.body) as Map<String, dynamic>;
      } catch (e) {
        print('LOGIN: failed to parse JSON: $e');
      }

      final backendStatus =
          responseData['status']?.toString().toLowerCase() ?? 'error';
      final backendMessage =
          responseData['message']?.toString() ?? 'Unknown error';

      if (response.statusCode == 200 && backendStatus == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login Successful!")),
        );
        Future.delayed(const Duration(milliseconds: 200), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(backendMessage)),
        );
      }
    } catch (e) {
      print('LOGIN: exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Network error: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5,
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    // Email
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Password
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Sign In Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: isLoading
                              ? const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.5,
                                    color: Colors.white,
                                  ),
                                )
                              : IconButton(
                                  onPressed: isLoading ? null : loginUser,
                                  icon: const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    // Sign Up / Forgot Password Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyForgotPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color(0xff4c505b),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Check Button
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Check button pressed")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4c505b),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        "Check",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
