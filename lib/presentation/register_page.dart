import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/presentation/login_page.dart';

import '../bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Register User')),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () {
                      final requestModel = RegisterRequestModel(
                          name: nameController!.text,
                          email: emailController!.text,
                          password: passwordController!.text);
                      context.read<RegisterBloc>().add(
                            DoRegisterEvent(model: requestModel),
                          );
                    },
                    child: const Text('Register'));
              },
              listener: (context, state) {
                if (state is RegisterError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ));
                }

                if (state is RegisterLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Register Success with id: ${state.model.id}'),
                    backgroundColor: Colors.blue,
                  ));
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const LoginPage();
                }));
              },
              child: const Text('Sudah punya akun? Login'),
            )
            // BlocListener<RegisterBloc, RegisterState>(
            //   listener: (context, state) {
            //     if (state is RegisterError) {
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content: Text(state.message),
            //         backgroundColor: Colors.red,
            //       ));
            //     }

            //     if (state is RegisterLoaded) {
            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //         content:
            //             Text('Register Success with id: ${state.model.id}'),
            //         backgroundColor: Colors.blue,
            //       ));
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return const LoginPage();
            //       }));
            //     }
            //   },
            //   child: BlocBuilder<RegisterBloc, RegisterState>(
            //     builder: (context, state) {
            //       if (state is RegisterLoading) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //       return ElevatedButton(
            //           onPressed: () {
            //             final requestModel = RegisterRequestModel(
            //                 name: nameController!.text,
            //                 email: emailController!.text,
            //                 password: passwordController!.text);
            //             context.read<RegisterBloc>().add(
            //                   DoRegisterEvent(model: requestModel),
            //                 );
            //           },
            //           child: const Text('Register'));
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
