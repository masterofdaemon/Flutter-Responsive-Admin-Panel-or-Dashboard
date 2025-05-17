import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin/services/auth_service.dart';
import 'package:admin/screens/signup_screen.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/l10n/app_localizations.dart'; // Import AppLocalizations
import 'package:admin/screens/main/main_screen.dart'; // Import MainScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;
  bool _isEmployeeLogin = false; // Added to toggle between user/employee login

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final authService = Provider.of<AuthService>(context, listen: false);
    final localizations = AppLocalizations.of(context);

    try {
      bool result;
      if (_isEmployeeLogin) {
        result = await authService.loginEmployee(
          _usernameController.text.trim(),
          _passwordController.text.trim(),
        );
      } else {
        result = await authService.login(
          _usernameController.text.trim(),
          _passwordController.text.trim(),
        );
      }
      
      if (result) {
        // Successful login - navigate to MainScreen
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        }
      } else {
        setState(() {
          _errorMessage = authService.errorMessage ??
              (_isEmployeeLogin ? localizations.loginScreenErrorLoginFailed : localizations.loginScreenErrorLoginFailed); // TODO: Differentiate error messages if needed
        });
      }
    } on GrpcError catch (e) {
      setState(() {
        _errorMessage = localizations.loginScreenErrorLoginFailedWithDetails(
            e.message ?? e.codeName.toString());
      });
    } catch (e) {
      setState(() {
        _errorMessage = localizations.loginScreenErrorUnexpected(e.toString());
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEmployeeLogin ? localizations.employeeLoginScreenTitle : localizations.loginScreenTitle), // Dynamic title
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    _isEmployeeLogin ? localizations.employeeLoginScreenTitle : localizations.loginScreenTitle, // Dynamic text
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.yellow),
                    textAlign: TextAlign.center,
                    selectionColor: Color.fromARGB(0, 67, 67, 218),
                  ),
                  const SizedBox(height: 24.0),

                  // Toggle between User and Employee Login
                  SwitchListTile(
                    title: Text(_isEmployeeLogin ? localizations.loginAsEmployee : localizations.loginAsUser),
                    value: _isEmployeeLogin,
                    onChanged: (bool value) {
                      setState(() {
                        _isEmployeeLogin = value;
                        // Optionally clear fields or error messages when toggling
                        _usernameController.clear();
                        _passwordController.clear();
                        _errorMessage = null;
                      });
                    },
                    secondary: Icon(_isEmployeeLogin ? Icons.work_outline : Icons.person_outline),
                  ),
                  const SizedBox(height: 24.0),
                  
                  // Signup Button (only for User login)
                  if (!_isEmployeeLogin)
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(localizations.loginScreenSignUpPromptText),
                    ),
                  if (!_isEmployeeLogin) const SizedBox(height: 16.0),

                  // Username Field
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: _isEmployeeLogin ? localizations.employeeUsernameHint : localizations.usernameHint, // Dynamic hint
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return localizations.loginScreenUsernameValidationEmpty;
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 16.0),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: localizations.passwordHint, // Localized hint
                      prefixIcon: Icon(Icons.lock_outline),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return localizations.loginScreenPasswordValidationEmpty;
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) =>
                        _isLoading ? null : _login(), // Allow login on enter
                  ),
                  const SizedBox(height: 24.0),

                  // Error Message Display
                  if (_errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  // Login Button
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: _login,
                          child: Text(localizations
                              .loginButtonText), // Localized button text
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
