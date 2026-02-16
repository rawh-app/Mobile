import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/medical-records.png', width: 20, height: 20),
              SizedBox(width: 5),
              Text(
                " تطور الحالة : تحسن ملحوظ",
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff123655),
                ),
              ),
            ],
          ),
          Divider(endIndent: 20),
          const SizedBox(height: 15),
          SizedBox(
            height: 80,
            child: CustomPaint(painter: LinePainter(), size: Size.infinite),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = Colors.orange;

    final path = Path();
    path.moveTo(0, size.height * .6);
    path.lineTo(size.width * .3, size.height * .4);
    path.lineTo(size.width * .6, size.height * .65);
    path.lineTo(size.width, size.height * .3);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
