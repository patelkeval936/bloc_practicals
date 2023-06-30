
import 'package:equatable/equatable.dart';

class TimerState extends Equatable{

  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitialState extends TimerState{
  const TimerInitialState(super.duration);
}

class TimerRunInProgress extends TimerState{
  const TimerRunInProgress(super.duration);
}

class TimerRunPaused extends TimerState{
 const TimerRunPaused(super.duration);
}

class TimerRunComplete extends TimerState{
  const TimerRunComplete() : super(0);
}