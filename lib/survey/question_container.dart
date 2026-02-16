import 'package:flutter/material.dart';

class QuestionRadioCard extends StatefulWidget {
  final String question;
  final List<String> options;
  final int initialValue;
  final ValueChanged<int> onChanged;

  const QuestionRadioCard({
    super.key,
    required this.question,
    required this.options,
    this.initialValue = -1,
    required this.onChanged,
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
      width: 290,
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    Radio<int>(
                      value: index,
                      groupValue: selectedValue,
                      activeColor: const Color(0xff5699D5),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                        widget.onChanged(value!);
                      },
                    ),
                    Expanded(
                      child: Text(
                        widget.options[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
