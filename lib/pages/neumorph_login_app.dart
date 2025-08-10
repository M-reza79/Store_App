import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphLoginApp
    extends StatelessWidget {
  const NeumorphLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      themeMode: ThemeMode.light,
      theme: const NeumorphicThemeData(
        baseColor: Color(0xFFE0E5EC),
        lightSource: LightSource.topLeft,
        depth: 8,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          NeumorphicTheme.baseColor(context),
      body: Center(
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: 20,
            boxShape:
                NeumorphicBoxShape.roundRect(
                  BorderRadius.circular(20),
                ),
          ),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(
              24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildInputField('Username'),
                const SizedBox(height: 16),
                _buildInputField(
                  'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 24),
                NeumorphicButton(
                  padding:
                      const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 40,
                      ),
                  onPressed: () {
                    // login logic
                  },
                  style: NeumorphicStyle(
                    shape:
                        NeumorphicShape.flat,
                    depth: 6,
                    boxShape:
                        NeumorphicBoxShape.stadium(),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign up",
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String hintText, {
    bool isPassword = false,
  }) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -4,
        boxShape:
            NeumorphicBoxShape.roundRect(
              BorderRadius.circular(12),
            ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
