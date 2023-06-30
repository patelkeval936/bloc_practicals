
class CounterState {
  int count1 = 0;
  int count2 = 0;

  CounterState(this.count1,this.count2);

  CounterState.copyWith({int? c1, int? c2}){
    count1 = c1 ?? count1;
    count2 = c2 ?? count2;
  }
}