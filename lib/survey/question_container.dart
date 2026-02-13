import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionRadioCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final Widget? child;
  final VoidCallback? onPressed;

  const QuestionRadioCard({
    super.key,
    required this.question,
    required this.options,
    this.initialValue = -1,
    required this.onChanged,
    this.child,
    this.onPressed,
  });

  @override
  State<QuestionRadioCard> createState() => _QuestionRadioCardState();
}

class _QuestionRadioCardState extends State<QuestionRadioCard> {
  late int selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            offset: const Offset(0, 6),
            blurRadius: 10,
            spreadRadius: -2,
          ),
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(-1, 0),
            blurRadius: 2,
            spreadRadius: -1,
          ),
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(1, 0),
            blurRadius: 2,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),

          Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Text(
              widget.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                letterSpacing: -0.5,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// Radio buttons (dynamic)
          ...List.generate(widget.options.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: [
                    RadioTheme(
                      data: RadioThemeData(
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(MaterialState.selected)) {
                            return Color(0xff5699D5);
                          }
                          return Color(0xff5699D5);
                        }),
                      ),
                      child: Radio<int>(
                        value: index,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                          widget.onChanged(value!);
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.options[index],
                        style: GoogleFonts.tajawal(
                          letterSpacing: -0.5,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 16),
          if (widget.child != null && widget.onPressed != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TextButton(
                onPressed: widget.onPressed,
                child: widget.child!,
              ),
            ),
        ],
      ),
    );
  }
}
