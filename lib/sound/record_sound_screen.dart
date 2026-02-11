import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rawh/sound/widget/custom_button.dart';
import 'package:record/record.dart';

class RecordSoundScreen extends StatefulWidget {
  const RecordSoundScreen({super.key});

  @override
  State<RecordSoundScreen> createState() => _State();
}

class _State extends State<RecordSoundScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();
  bool _isRecording = false;
  bool _isPlaying = false;
  bool _showInstructions = true;
  int time = 0;
  Timer? _timer;
  bool _isAudioReady = false;

  String? _filePath;

  late final RecorderController _recorderWaveController;
  late final PlayerController _playerWaveController;

  @override
  void initState() {
    super.initState();

    _recorderWaveController = RecorderController();
    _playerWaveController = PlayerController();

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          _isPlaying = false;
        });
        _playerWaveController.pausePlayer();
      }
    });
  }

  @override
  void dispose() {
    _recorderWaveController.dispose();
    _playerWaveController.dispose();
    _audioPlayer.dispose();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _startRecording() async {
    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) return;

    // لو فيه تسجيل قديم → نوقفه وننضف الحالة
    if (_isAudioReady) {
      await _audioPlayer.stop();
      await _playerWaveController.stopPlayer();
      // await _playerWaveController.reset(); // نعيد ضبط البيانات القديمة
    }

    final directory = await getApplicationDocumentsDirectory();
    final fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = '${directory.path}/$fileName';

    const config = RecordConfig(
      encoder: AudioEncoder.aacLc,
      sampleRate: 44100,
      bitRate: 192000,
    );

    // ابدأ التسجيل
    await _recorder.start(config, path: _filePath!);
    await _recorderWaveController.record(path: _filePath!);

    setState(() {
      _showInstructions = false; // نخفّي التعليمات
      _isRecording = true;
      _isAudioReady = false;
      _isPlaying = false;
      time = 0;
    });

    _startTimer();
  }

  Future<void> _stopRecording() async {
    await _recorder.stop();
    await _recorderWaveController.stop();

    // تجهيز waveform للتشغيل
    await _playerWaveController.preparePlayer(
      path: _filePath!,
      shouldExtractWaveform: true,
    );

    // تجهيز just_audio
    await _audioPlayer.stop();
    await _audioPlayer.setFilePath(_filePath!);

    _timer?.cancel();

    setState(() {
      _isRecording = false;
      _isAudioReady = true;
      _isPlaying = false;
    });
  }

  Future<void> _playRecording() async {
    if (!_isAudioReady) return;

    // لو الصوت خلص قبل كده
    if (_audioPlayer.processingState == ProcessingState.completed) {
      await _audioPlayer.seek(Duration.zero);
      await _playerWaveController.seekTo(0);
    }

    setState(() {
      _isPlaying = true;
    });

    await Future.wait([
      _audioPlayer.play(),
      _playerWaveController.startPlayer(),
    ]);
  }

  Future<void> _pausePlaying() async {
    await _audioPlayer.pause();
    await _playerWaveController.pausePlayer();

    setState(() {
      _isPlaying = false;
    });
  }

  void _startTimer() {
    _timer?.cancel();
    time = 0;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      setState(() {
        time++;
      });

      if (time >= 6) {
        timer.cancel();
        await _stopRecording();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Color(0xff1E609D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 3, right: 3),
                  width: double.infinity,
                  height: 345,
                  decoration: BoxDecoration(
                    color: Color(0xff1E609D),
                    border: Border(
                      bottom: BorderSide(color: Color(0xffF3F9FF), width: 0.5),
                      right: BorderSide(color: Color(0xffF3F9FF), width: 0.3),
                      left: BorderSide(color: Color(0xffF3F9FF), width: 0.3),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(75),
                      bottomRight: Radius.circular(75),
                    ),
                  ),
                ),

                Positioned(
                  top: 97,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "سجلي صوت نفس طفلك",
                      style: GoogleFonts.tajawal(
                        letterSpacing: -0.5,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                // أثناء التسجيل (Live)
                if (_isRecording)
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: AudioWaveforms(
                          recorderController: _recorderWaveController,
                          size: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            70,
                          ),
                          waveStyle: const WaveStyle(
                            waveColor: Colors.white,
                            extendWaveform: true,
                            showMiddleLine: false,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (!_isRecording && _filePath != null)
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: AudioFileWaveforms(
                          size: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            70,
                          ),
                          playerController: _playerWaveController,
                        ),
                      ),
                    ),
                  ),

                Positioned(
                  top: 15,
                  left: 6,
                  child: Image.asset(
                    'assets/cloud.png',
                    width: 100,
                    height: 100,
                  ),
                ),

                Positioned(
                  bottom: 30,
                  right: 50,
                  child: InkWell(
                    onTap: (_isRecording || !_isAudioReady)
                        ? null
                        : () {
                            if (_isPlaying) {
                              _pausePlaying();
                            } else {
                              _playRecording();
                            }
                          },

                    child: CircleAvatar(
                      backgroundColor: Color(0xff123655),
                      radius: 18,
                      child: Icon(
                        _isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 27,
                        color: (!_isAudioReady || _isRecording)
                            ? Colors.white38
                            : Colors.white,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 30,
                  left: 50,
                  child: RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: time.toString().padLeft(2, '0'),
                          style: GoogleFonts.tajawal(
                            letterSpacing: -0.5,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: Transform.translate(
                            offset: Offset(4, 10),
                            child: Text(
                              'sec',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "سيتم التسجيل لمدة 45 ثانية",
              style: GoogleFonts.tajawal(
                letterSpacing: -0.5,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 33, 88, 140),
              ),
            ),

            SizedBox(height: 50),

            // التعليمات
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  if (_showInstructions) ...[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff123655),
                          radius: 18,
                          child: Icon(
                            FontAwesome.microphone_lines_slash_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "يرجى اختيار مكان هادئ ، وإغلاق أي مصدر للضوضاء.",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff123655),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff123655),
                          radius: 18,
                          child: Icon(
                            FontAwesome.baby_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "احرصي أن يكون طفلك هادئًا ومرتاحًا سواء كان نائمًا أو جالسًا.",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff123655),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff123655),
                          radius: 18,
                          child: Icon(
                            FontAwesome.ruler_combined_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "قربي الهاتف من صدر طفلك بمسافة 10-15 سم تقريبًا",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff123655),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff123655),
                          radius: 18,
                          child: Icon(
                            FontAwesome.baby_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "اتركي الطفل يتنفس بشكل طبيعي دون تدخل",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff123655),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xff123655),
                          radius: 18,
                          child: Icon(
                            FontAwesome.baby_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            "لا تقومي بالتسجيل إذا بدأ الطفل بالبكاء أو السعال",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff123655),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                  // زر التسجيل أو إعادة التسجيل
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: CustomButton(
                      color: _showInstructions
                          ? Color(0xff2874B9)
                          : Colors.white,
                      onPressed: _isRecording
                          ? null
                          : () async {
                              // أول ما تدوسي على الزر نخلي _showInstructions=false عشان تظهر تعليمات إعادة التسجيل
                              setState(() {
                                _showInstructions = false;
                              });

                              // لو فيه تسجيل سابق، نوقفه وننضف البيانات القديمة
                              if (_isAudioReady) {
                                await _audioPlayer.stop();
                                await _playerWaveController.stopPlayer();
                                // مش لازم تعمل dispose أو إعادة تهيئة
                                _isAudioReady = false;
                              }

                              // ابدأ التسجيل
                              await _startRecording();
                            },
                      borderRadius: 22,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: 23,
                            color: _showInstructions
                                ? Colors.white
                                : Color(0xff123655),
                          ),
                          SizedBox(width: 5),
                          Text(
                            _showInstructions ? "بدء التسجيل" : "إعادة التسجيل",
                            style: GoogleFonts.tajawal(
                              letterSpacing: -0.5,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _showInstructions
                                  ? Colors.white
                                  : Color(0xff123655),
                            ),
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
      ),
    );
  }
}
