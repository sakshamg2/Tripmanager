import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0081A7),
        title: const Text(
          "Help",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "What can I help you with?",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.report_problem,
                  label: "Describe your issues",
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.help_outline,
                  label: "How to use it",
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.article,
                  label: "Popular articles",
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.info_outline,
                  label: "About us",
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.lock_outline,
                  label: "How do I change my password?",
                ),
                SizedBox(height: 20.0),
                CustomTextField(
                  icon: Icons.group_add_outlined,
                  label: "How to join?",
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;

  const CustomTextField({super.key, required this.icon, required this.label});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: _hovering ? const Color(0xFF0081A7) : Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _hovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            _hovering = false;
          });
        },
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  widget.icon,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  size: 10,
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
