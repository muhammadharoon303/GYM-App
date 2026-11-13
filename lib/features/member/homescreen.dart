import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Color blueColor = const Color(0xFF2196F3);
  final Color cardColor = const Color(0xFF1A1A1A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER =================
              buildHeader(),

              const SizedBox(height: 22),

              // ================= WEEK CALENDAR =================
              buildWeekCalendar(),

              const SizedBox(height: 18),

              // ================= STATISTICS =================
              buildStatistics(),

              const SizedBox(height: 25),

              // ================= CONTINUE WORKOUT =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Continue Workout",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Merriweather Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  Text(
                    "View All",
                    style: TextStyle(
                      color: blueColor,
                      fontFamily: 'Merriweather Sans',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              buildWorkoutCard(),

              const SizedBox(height: 14),

              // ================= TRACK PROGRESS =================
              buildProgressCard(),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  // =========================================================
  // HEADER
  // =========================================================

  Widget buildHeader() {
    return Row(
      children: [
        // Profile image
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: blueColor, width: 2),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/home/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(width: 10),

        // Greeting
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good morning",
              style: TextStyle(
                color: Colors.white60,
                fontFamily: 'Merriweather Sans',
                fontSize: 8,
              ),
            ),

            SizedBox(height: 3),

            Text(
              "Ali Khan",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Merriweather Sans',
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const Spacer(),

        // Notification button
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1C),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.notifications_none_outlined,
            color: Colors.white,
            size: 17,
          ),
        ),
      ],
    );
  }

  // =========================================================
  // WEEK CALENDAR
  // =========================================================

  Widget buildWeekCalendar() {
    final List<String> days = ["S", "M", "T", "W", "T", "F", "S"];
    final List<String> dates = ["16", "17", "18", "19", "20", "21", "22"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(days.length, (index) {
        bool isSelected = index == 2;

        return Column(
          children: [
            Text(
              days[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white38,
                fontFamily: 'Merriweather Sans',
                fontSize: 8,
              ),
            ),

            const SizedBox(height: 7),

            Container(
              width: 35,
              height: 45,
              decoration: BoxDecoration(
                color: isSelected ? blueColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    dates[index],
                    style: TextStyle(
                      color: isSelected ? blueColor : blueColor,
                      fontFamily: 'Merriweather Sans',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // =========================================================
  // STATISTICS
  // =========================================================

  Widget buildStatistics() {
    return SizedBox(
      height: 118,
      child: Row(
        children: [
          // Completed Workouts
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.fitness_center,
                    color: Colors.white,
                    size: 30,
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    "24",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Merriweather Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 2),

                  const Text(
                    "Completed\nWorkouts",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'Merriweather Sans',
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Right cards
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),

                      // Blue border from your design
                      border: Border.all(color: blueColor, width: 2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_walk,
                          color: Colors.white,
                          size: 25,
                        ),

                        SizedBox(width: 8),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "12.9k",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Merriweather Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Steps",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                          size: 25,
                        ),

                        SizedBox(width: 8),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "789 Kcal",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Merriweather Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Calories",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 8,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // WORKOUT CARD
  // =========================================================

  Widget buildWorkoutCard() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/home/workout.png'),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.25), Colors.transparent],
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Flexibility +\nRecovery",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Merriweather Sans',
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),

            Spacer(),

            Text(
              "12 Exercise",
              style: TextStyle(color: Colors.white, fontSize: 9),
            ),

            SizedBox(height: 5),

            Text("58 Mins", style: TextStyle(color: Colors.white, fontSize: 9)),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // TRACK PROGRESS
  // =========================================================

  Widget buildProgressCard() {
    return Container(
      width: double.infinity,
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Row(
        children: [
          Icon(Icons.bar_chart, color: Colors.white, size: 28),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Track Progress",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Merriweather Sans',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 3),

                Text(
                  "You're making serious progress —\n"
                  "further than 45% of users!",
                  style: TextStyle(color: Colors.white70, fontSize: 8),
                ),
              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15),
        ],
      ),
    );
  }

  // =========================================================
  // BOTTOM NAVIGATION
  // =========================================================

  Widget buildBottomNavigation() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      height: 45,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavItem(Icons.home, true),
          buildNavItem(Icons.fitness_center, false),
          buildNavItem(Icons.groups_outlined, false),
          buildNavItem(Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget buildNavItem(IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: isSelected ? blueColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.white : Colors.white54,
        size: 18,
      ),
    );
  }
}
