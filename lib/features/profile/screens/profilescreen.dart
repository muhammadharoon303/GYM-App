import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  int currentStep = 0;

  String? gender;
  String? selectedGoal;
  String? activityLevel;

  String weightUnit = "Kg";
  String heightUnit = "Cm";

  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  final Color bgColor = const Color(0xFF111111);
  final Color fieldColor = const Color(0xFF1C1C1C);
  final Color blueColor = const Color(0xFF258AF5);

  final List<String> goals = [
    "Lose Weight",
    "Build Muscle",
    "Stay Fit",
    "Improve Strength",
    "Increase Endurance",
  ];

  final List<String> activities = [
    "Sedentary",
    "Light",
    "Moderate",
    "Active",
    "Very Active",
  ];

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  // MAIN SCREEN
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile Setup",
                style: TextStyle(
                  fontFamily: 'Merriweather Sans',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 15),

              buildProgressIndicator(),

              const SizedBox(height: 25),

              Expanded(child: SingleChildScrollView(child: buildCurrentStep())),

              const SizedBox(height: 15),

              buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // PROGRESS INDICATOR
  Widget buildProgressIndicator() {
    return Row(
      children: [
        buildStepItem(0, "Info"),
        buildProgressLine(0),
        buildStepItem(1, "Goals"),
        buildProgressLine(1),
        buildStepItem(2, "Others"),
      ],
    );
  }

  Widget buildStepItem(int step, String title) {
    bool completed = currentStep > step;
    bool active = currentStep == step;

    return Column(
      children: [
        Container(
          width: 17,
          height: 17,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: completed ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: active ? 3 : 1),
          ),
          child: completed
              ? const Icon(Icons.check, size: 12, color: Colors.black)
              : null,
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 9)),
      ],
    );
  }

  Widget buildProgressLine(int step) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 1,
        color: currentStep > step ? Colors.white : Colors.white54,
      ),
    );
  }

  // SELECT CURRENT STEP
  Widget buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return buildInfoPage();
      case 1:
        return buildGoalsPage();
      case 2:
        return buildOthersPage();
      default:
        return const SizedBox();
    }
  }

  // STEP 1: INFO
  Widget buildInfoPage() {
    return Column(
      children: [
        buildDropdown(
          hint: "Gender",
          value: gender,
          items: const ["Male", "Female", "Other"],
          onChanged: (value) {
            setState(() => gender = value);
          },
        ),

        const SizedBox(height: 12),

        buildTextField(
          "Age",
          ageController,
          keyboardType: TextInputType.number,
        ),

        const SizedBox(height: 12),

        buildMeasurementField(
          hint: "Weight",
          controller: weightController,
          firstUnit: "Kg",
          secondUnit: "Lb",
          selectedUnit: weightUnit,
          onUnitChanged: (value) {
            setState(() => weightUnit = value);
          },
        ),

        const SizedBox(height: 12),

        buildMeasurementField(
          hint: "Height",
          controller: heightController,
          firstUnit: "Feet",
          secondUnit: "Cm",
          selectedUnit: heightUnit,
          onUnitChanged: (value) {
            setState(() => heightUnit = value);
          },
        ),
      ],
    );
  }

  // STEP 2: GOALS
  Widget buildGoalsPage() {
    return Column(
      children: [
        buildDropdown(
          hint: "Goal",
          value: selectedGoal,
          items: goals,
          onChanged: (value) {
            setState(() => selectedGoal = value);
          },
        ),
      ],
    );
  }

  // STEP 3: OTHERS
  Widget buildOthersPage() {
    return buildDropdown(
      hint: "Physical Activity Level",
      value: activityLevel,
      items: activities,
      onChanged: (value) {
        setState(() => activityLevel = value);
      },
    );
  }

  // REUSABLE DROPDOWN
  Widget buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          dropdownColor: const Color(0xFF303030),
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          style: const TextStyle(color: Colors.white, fontSize: 12),
          items: items.map((item) {
            return DropdownMenuItem(value: item, child: Text(item));
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // REUSABLE TEXT FIELD
  Widget buildTextField(
    String hint,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white, fontSize: 12),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 11),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // WEIGHT AND HEIGHT FIELDS
  Widget buildMeasurementField({
    required String hint,
    required TextEditingController controller,
    required String firstUnit,
    required String secondUnit,
    required String selectedUnit,
    required ValueChanged<String> onUnitChanged,
  }) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 16, right: 8),
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(color: Colors.white, fontSize: 12),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.white, fontSize: 11),
                border: InputBorder.none,
              ),
            ),
          ),

          buildUnitButton(
            firstUnit,
            selectedUnit,
            () => onUnitChanged(firstUnit),
          ),

          const SizedBox(width: 5),

          buildUnitButton(
            secondUnit,
            selectedUnit,
            () => onUnitChanged(secondUnit),
          ),
        ],
      ),
    );
  }

  Widget buildUnitButton(String unit, String selectedUnit, VoidCallback onTap) {
    bool selected = unit == selectedUnit;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          unit,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white54,
            fontSize: 8,
          ),
        ),
      ),
    );
  }

  // BACK AND CONTINUE BUTTONS
  Widget buildNavigationButtons() {
    return Row(
      children: [
        if (currentStep > 0) ...[
          Expanded(
            child: SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  setState(() => currentStep--);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white38),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Back"),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],

        Expanded(
          flex: 2,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: handleContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                currentStep == 2 ? "Complete" : "Continue",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // VALIDATION AND NAVIGATION
  void handleContinue() {
    if (currentStep == 0) {
      if (gender == null ||
          ageController.text.isEmpty ||
          weightController.text.isEmpty ||
          heightController.text.isEmpty) {
        showMessage("Please complete all information.");
        return;
      }

      if (int.tryParse(ageController.text) == null ||
          double.tryParse(weightController.text) == null ||
          double.tryParse(heightController.text) == null) {
        showMessage("Please enter valid numeric values.");
        return;
      }
    }

    if (currentStep == 1 && selectedGoal == null) {
      showMessage("Please select your fitness goal.");
      return;
    }

    if (currentStep == 2 && activityLevel == null) {
      showMessage("Please select your activity level.");
      return;
    }

    if (currentStep < 2) {
      setState(() => currentStep++);
    } else {
      showMessage("Profile setup completed!");

      // Later, save profile data to Firebase or your backend.
      debugPrint("Gender: $gender");
      debugPrint("Age: ${ageController.text}");
      debugPrint("Weight: ${weightController.text} $weightUnit");
      debugPrint("Height: ${heightController.text} $heightUnit");
      debugPrint("Goal: $selectedGoal");
      debugPrint("Activity: $activityLevel");
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
