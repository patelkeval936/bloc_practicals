
class TimerEvent{}

class TimerStarted extends TimerEvent {
  int duration;
  TimerStarted({required this. duration});
}

class TimerPaused extends TimerEvent {}
class TimerResumed extends TimerEvent {}
class TimerReset extends TimerEvent {}

class _TimerTicked extends TimerEvent {
   int duration;
  _TimerTicked({required this.duration});
}
