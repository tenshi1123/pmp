import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pmp_english/utils/constants/color.dart';
import 'package:pmp_english/utils/constants/styles.dart';

class FlutterSoundRecorderWidget extends StatefulWidget {
  final String questionId;
  final ValueNotifier<Map<String, String>> counter;

  const FlutterSoundRecorderWidget({
    super.key,
    required this.questionId,
    required this.counter,
  });

  @override
  State<FlutterSoundRecorderWidget> createState() =>
      _FlutterSoundRecorderWidgetState();
}

class _FlutterSoundRecorderWidgetState
    extends State<FlutterSoundRecorderWidget> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecorderReady = false;
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _recordedFilePath;
  bool isCan = false;
  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    await Permission.microphone.request();
    await _recorder.openRecorder();
    await _player.openPlayer();
    _isRecorderReady = true;
    setState(() {});
  }

  Future<void> _startRecording() async {
    if (!_isRecorderReady) return;
    final dir = await getTemporaryDirectory();
    final filePath =
        '${dir.path}/record_${widget.questionId}_${DateTime.now().millisecondsSinceEpoch}.aac';

    await _recorder.startRecorder(toFile: filePath);
    isCan = false;
    setState(() {
      _isRecording = true;
      _recordedFilePath = filePath;
    });
  }

  Future<void> _stopRecording() async {
    if (!_isRecorderReady) return;
    await _recorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
    if (_recordedFilePath != null) {
      final updated = Map<String, String>.from(widget.counter.value);
      updated[widget.questionId] = _recordedFilePath!;
      widget.counter.value = updated;
      isCan = true;
    }
  }

  Future<void> _pauseRecording() async {
    if (_isRecorderReady && _isRecording) {
      await _recorder.pauseRecorder();
      setState(() {
        _isRecording = false;
      });
    }
    isCan = false;
  }

  Future<void> _resumeRecording() async {
    if (_isRecorderReady && !_isRecording) {
      await _recorder.resumeRecorder();
      setState(() {
        _isRecording = true;
      });
    }
    isCan = false;
  }

  Future<void> _togglePlay() async {
    if (_recordedFilePath == null) return;
    if (_isPlaying) {
      await _player.stopPlayer();
      setState(() {
        _isPlaying = false;
      });
    } else {
      await _player.startPlayer(
        fromURI: _recordedFilePath!,
        whenFinished: () {
          setState(() {
            _isPlaying = false;
          });
        },
      );
      setState(() {
        _isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isCan
            ? Text(
                'Đã lưu bản ghi',
                style: defaultText14M.copyWith(color: key2Color),
              )
            : Text(
                '! Sau khi hoàn thành thu âm, ấn End để lưu bản ghi',
                style: defaultText14M.copyWith(color: sub1Color),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_recordedFilePath != null)
              ElevatedButton(
                onPressed: _isRecording ? _pauseRecording : _resumeRecording,
                child: Text(_isRecording ? 'Pause' : 'Resume'),
              ),
            ElevatedButton.icon(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              label: Text(_isRecording ? 'End' : 'New'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isRecording ? sub2Color : main2Color,
              ),
            ),
          ],
        ),
        if (_recordedFilePath != null) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _recordedFilePath!.split('/').last,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
              IconButton(
                onPressed: _togglePlay,
                icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
