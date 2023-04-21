import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  int _minutes = 25;
  int _seconds = 0;
  int _currentMinutes = 25;
  int _currentSeconds = 0;
  bool _isActive = false;
  Timer _timer = Timer.periodic(Duration(), (_) {});

  void _startTimer() {
    setState(() {
      _isActive = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentMinutes == 0 && _currentSeconds == 0) {
        _resetTimer();
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text('Time is up!'),
            content: Text('Your Pomodoro session has ended.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      setState(() {
        if (_currentSeconds == 0) {
          _currentSeconds = 59;
          _currentMinutes--;
        } else {
          _currentSeconds--;
        }
      });
    });
  }

  void _resetTimer() {
    setState(() {
      _isActive = false;
      _currentMinutes = _minutes;
      _currentSeconds = _seconds;
    });
    _timer.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        (_currentMinutes * 60 + _currentSeconds) / (_minutes * 60 + _seconds);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_currentMinutes:${_currentSeconds.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 72.0),
            ),
            SizedBox(height: 16.0),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.lightGreen[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isActive ? null : _startTimer,
                  child: Text('Start'),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _isActive ? _resetTimer : null,
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}