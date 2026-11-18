import 'package:flutter/material.dart';
import 'package:math/features/screens/theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02020C),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF103B46),
                border: Border.all(color: Colors.cyan, width: 2),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SETTINGS',
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ThemeScreen(),));
                        },
                        child: Container(
                          color: const Color(0xFF641C30),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 35),

                  Row(
                    children: [
                      tab('AUDIO', true),
                      const SizedBox(width: 10),
                      tab('PROFILE', false),
                      const SizedBox(width: 10),
                      tab('ANALYTICS', false),
                    ],
                  ),

                  const SizedBox(height: 40),

                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D304C),
                      border: Border.all(color: Colors.cyan.shade800),
                    ),
                    child: Row(
                      children: [
                        settingCard('AUDIO', 'MUTED', const Color(0xFF742034)),
                        const SizedBox(width: 15),
                        settingCard(
                          'VIBRATION',
                          'HAPTICS: ON',
                          const Color(0xFF203E7C),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  sliderBox(31, Colors.cyanAccent),

                  const SizedBox(height: 25),

                  sliderBox(85, const Color(0xFFFFD52F), showTest: true),

                  const SizedBox(height: 35),

                  Container(
                    height: 65,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D304C),
                      border: Border.all(color: Colors.cyan),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(
                        25,
                        (index) => Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            height: 55,
                            color: index > 19
                                ? Colors.yellow
                                : Colors.cyanAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget tab(String title, bool active) {
    return Expanded(
      child: Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF0D304C),
          border: Border(
            bottom: BorderSide(
              color: active ? Colors.cyanAccent : Colors.cyan,
              width: active ? 5 : 1,
            ),
            top: const BorderSide(color: Colors.cyan),
            left: const BorderSide(color: Colors.cyan),
            right: const BorderSide(color: Colors.cyan),
          ),
        ),
        child: FittedBox(
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.cyanAccent : Colors.blueGrey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget settingCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF103B46),
          border: Border.all(color: Colors.cyan.shade800),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 45,
              width: double.infinity,
              alignment: Alignment.center,
              color: color,
              child: FittedBox(
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sliderBox(double value, Color color, {bool showTest = false}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0D304C),
        border: Border.all(color: Colors.cyan.shade800),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '${value.toInt()}%',
              style: TextStyle(
                color: color,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 22,
                    activeTrackColor: color,
                    inactiveTrackColor: color.withAlpha(50),
                    thumbColor: Colors.white,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 11,
                    ),
                  ),
                  child: Slider(
                    value: value,
                    min: 0,
                    max: 100,
                    onChanged: (_) {},
                  ),
                ),
              ),
              if (showTest)
                Container(
                  width: 85,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF45455D),
                    border: Border.all(color: Colors.yellow),
                  ),
                  child: const Text(
                    'TEST',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
