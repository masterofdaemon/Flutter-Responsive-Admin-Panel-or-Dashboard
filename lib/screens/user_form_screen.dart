import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/services/grpc_client_service.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:admin/l10n/app_localizations.dart'; // Import AppLocalizations

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({super.key});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final GrpcClientService _grpcService = GrpcClientService();
  bool _isLoading = false;

  // Text Editing Controllers
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _createUser() async {
    final localizations = AppLocalizations.of(context);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations.passwordsDoNotMatchError)), // Localized
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final userId = await _grpcService.createUser(
        _loginController.text.trim(),
        _passwordController.text,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(localizations
                .userCreatedSuccessIdMessage(userId.toString()))), // Localized
      );
      Navigator.of(context).pop(true);
    } on GrpcError catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations.grpcErrorCreatingUserMessage(
                  e.message ?? 'Unknown error'))), // Localized
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(localizations
                  .errorCreatingUserMessage(e.toString()))), // Localized
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context); // Get localizations

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.userFormScreenTitle), // Localized
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            }
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelText:
                            localizations.loginEmailLabelText, // Localized
                        border: OutlineInputBorder(),
                        hintText: localizations.loginEmailHintText, // Localized
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return localizations
                              .pleaseEnterLoginEmailError; // Localized
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return localizations
                              .pleaseEnterValidEmailError; // Localized
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: localizations
                            .passwordHint, // Reused from login/signup
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return localizations
                              .pleaseEnterPasswordError; // Reused
                        }
                        if (value.length < 6) {
                          return localizations.passwordMinLengthError; // Reused
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),

                    TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: localizations.confirmPasswordHint, // Reused
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return localizations
                              .pleaseConfirmPasswordError; // Reused
                        }
                        if (value != _passwordController.text) {
                          return localizations
                              .passwordsDoNotMatchError; // Reused
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),

                    Center(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.person_add_alt_1),
                        label: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Text(
                              localizations.createUserButtonText), // Localized
                        ),
                        onPressed: _isLoading ? null : _createUser,
                        style: ElevatedButton.styleFrom(
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0), // Bottom padding
                  ],
                ),
              ),
            ),
    );
  }
}
