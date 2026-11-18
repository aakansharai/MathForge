import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF02020C),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF103B46),
                border: Border.all(color: Colors.cyanAccent, width: 2),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),

                  const Text(
                    'THEME PALETTES',
                    style: TextStyle(
                      color: Colors.cyanAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 25),

                  palette(
                    'Neon Default',
                    const Color(0xFF00EDE5),
                    const Color(0xFFFFD52F),
                    true,
                  ),

                  const SizedBox(height: 15),

                  palette(
                    'Vaporwave Pink',
                    const Color(0xFFFF20A0),
                    const Color(0xFF00E5FF),
                    false,
                  ),

                  const SizedBox(height: 15),

                  palette(
                    'Matrix Green',
                    const Color(0xFF00F060),
                    const Color(0xFFB5FF00),
                    false,
                  ),

                  const SizedBox(height: 15),

                  palette(
                    'Cyberpunk Orange',
                    const Color(0xFFFF8500),
                    const Color(0xFF00CFFF),
                    false,
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF742034),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: const Text(
                        'CLOSE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget palette(String name, Color primary, Color secondary, bool active) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primary.withOpacity(0.10),
        border: Border.all(color: primary),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 85,
            color: primary,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.topCenter,
            child: Container(width: 42, height: 60, color: secondary),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: primary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            width: 110,
            height: 65,
            alignment: Alignment.center,
            color: active ? const Color(0xFF0750EF) : Colors.black,
            child: Text(
              active ? 'ACTIVE' : 'SELECT',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
