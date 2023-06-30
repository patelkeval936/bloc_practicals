//
// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:bloc_practicals/timer/bloc/timer_event.dart';
// import 'package:bloc_practicals/timer/bloc/timer_state.dart';
//
// import '../timer.dart';
//
// class TimerBloc extends Bloc<TimerEvent,TimerState>{
//   TimerBloc(this._ticker) : super(const TimerInitialState(_duration)){
//     on<TimerStarted>(_onStarted);
//     on<TimerPaused>(_onPaused);
//     on<TimerResumed>(_onResumed);
//     on<TimerReset>(_onReset);
//
// }
//
//   StreamSubscription<int>? _tickerSubscription;
//   final Ticker _ticker;
//   static const int _duration = 60;
//
//   @override
//   Future<void> close() {
//     _tickerSubscription?.cancel();
//     return super.close();
//   }
//
//   void _onStarted(TimerStarted event, Emitter<TimerState> emit) {
//     emit(TimerRunInProgress(event.duration));
//     _tickerSubscription?.cancel();
//     _tickerSubscription = _ticker.
//         tick(ticks: event.duration)
//         .listen((duration) => add(TimerTicked(duration: duration)));
//   }
//
//   void _onPaused(TimerPaused event, Emitter<TimerState> emit) {
//     if (state is TimerRunInProgress) {
//       _tickerSubscription?.pause();
//       emit(TimerRunPause(state.duration));
//     }
//   }
//
//   void _onResumed(TimerResumed resume, Emitter<TimerState> emit) {
//     if (state is TimerRunPause) {
//       _tickerSubscription?.resume();
//       emit(TimerRunInProgress(state.duration));
//     }
//   }
//
//   void _onReset(TimerReset event, Emitter<TimerState> emit) {
//     _tickerSubscription?.cancel();
//     emit(const TimerInitial(_duration));
//   }
//
// }