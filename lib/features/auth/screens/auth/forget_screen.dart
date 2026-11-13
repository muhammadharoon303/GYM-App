import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Controls which screen is shown
  int currentStep = 0;

  // Controllers
  final emailController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Password visibility
  bool isNewPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  final Color backgroundColor = const Color(0xFF101010);
  final Color fieldColor = const Color(0xFF1C1C1C);
  final Color blueColor = const Color(0xFF258AF5);

  @override
  void dispose() {
    emailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current page content
              Expanded(child: buildCurrentPage()),

              // Bottom button
              buildBottomButton(),
            ],
          ),
        ),
      ),
    );
  }

  // Shows the page according to currentStep
  Widget buildCurrentPage() {
    if (currentStep == 0) {
      return buildForgotPasswordPage();
    } else if (currentStep == 1) {
      return buildOtpPage();
    } else {
      return buildNewPasswordPage();
    }
  }

  // STEP 1: FORGOT PASSWORD

  Widget buildForgotPasswordPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),

        const Text(
          "Forgot Password",
          style: TextStyle(
            fontFamily: 'Merriweather Sans',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "Enter your email address and we'll send you a verification\n"
          "code to reset your password.",
          style: TextStyle(color: Colors.white70, fontSize: 10),
        ),

        const SizedBox(height: 25),

        buildTextField(
          hint: "Email",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  // ============================================================
  // STEP 2: OTP VERIFICATION
  // ============================================================

  Widget buildOtpPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),

        // Back button and title
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  currentStep = 0;
                });
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),

            const Text(
              "OTP Verification",
              style: TextStyle(
                fontFamily: 'Merriweather Sans',
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),

        const SizedBox(height: 5),

        const Text(
          "We've sent a 6-digit code to your email. Enter it below\n"
          "to continue.",
          style: TextStyle(color: Colors.white70, fontSize: 10),
        ),

        const SizedBox(height: 30),

        // OTP Fields
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) => buildOtpBox()),
        ),

        const SizedBox(height: 30),

        const Center(
          child: Text(
            "00:24",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),

        const SizedBox(height: 25),

        Center(
          child: GestureDetector(
            onTap: () {
              // Resend OTP code here
            },
            child: Text(
              "Send again",
              style: TextStyle(
                color: blueColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STEP 3: NEW PASSWORD
  // ============================================================

  Widget buildNewPasswordPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),

        const Text(
          "New Password",
          style: TextStyle(
            fontFamily: 'Merriweather Sans',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "Create New Password",
          style: TextStyle(color: Colors.white70, fontSize: 10),
        ),

        const SizedBox(height: 25),

        // New Password
        buildPasswordField(
          hint: "New Password",
          controller: newPasswordController,
          isHidden: isNewPasswordHidden,
          onVisibilityChanged: () {
            setState(() {
              isNewPasswordHidden = !isNewPasswordHidden;
            });
          },
        ),

        const SizedBox(height: 12),

        // Confirm Password
        buildPasswordField(
          hint: "Confirm New Password",
          controller: confirmPasswordController,
          isHidden: isConfirmPasswordHidden,
          onVisibilityChanged: () {
            setState(() {
              isConfirmPasswordHidden = !isConfirmPasswordHidden;
            });
          },
        ),
      ],
    );
  }

  // ============================================================
  // REUSABLE TEXT FIELD
  // ============================================================

  Widget buildTextField({
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 11),
          filled: true,
          fillColor: fieldColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PASSWORD FIELD
  // ============================================================

  Widget buildPasswordField({
    required String hint,
    required TextEditingController controller,
    required bool isHidden,
    required VoidCallback onVisibilityChanged,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: isHidden,
        style: const TextStyle(color: Colors.white, fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 11),
          filled: true,
          fillColor: fieldColor,

          suffixIcon: IconButton(
            onPressed: onVisibilityChanged,
            icon: Icon(
              isHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.white70,
              size: 20,
            ),
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 16),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // OTP BOX
  // ============================================================

  Widget buildOtpBox() {
    return SizedBox(
      width: 40,
      height: 40,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: fieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // BOTTOM BUTTON
  Widget buildBottomButton() {
    String buttonText;

    if (currentStep == 0) {
      buttonText = "Continue";
    } else if (currentStep == 1) {
      buttonText = "Verify";
    } else {
      buttonText = "Change Password";
    }

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          handleButtonPress();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: blueColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // BUTTON NAVIGATION
  void handleButtonPress() {
    if (currentStep == 0) {
      // Check email
      if (emailController.text.isEmpty) {
        showMessage("Please enter your email.");
        return;
      }

      setState(() {
        currentStep = 1;
      });
    } else if (currentStep == 1) {
      // Verify OTP
      setState(() {
        currentStep = 2;
      });
    } else {
      // Check passwords
      if (newPasswordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        showMessage("Please fill both password fields.");
        return;
      }

      if (newPasswordController.text != confirmPasswordController.text) {
        showMessage("Passwords does not match.");
        return;
      }

      showMessage("Password changed successfully!");

      // Later: Navigate back to Login Screen
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
