import 'dart:core';

class Stats {
  int totalPredictTime;
  int totalElapsedTime;
  int inferenceTime;
  int preprocessingTime;

  Stats({
    this.totalPredictTime=0,
    this.totalElapsedTime=0,
    this.inferenceTime=0,
    this.preprocessingTime=0
  });

  @override
  String toString() {
    return 'Stats{totalPredictTime: $totalPredictTime, totalElapsedTime: $totalElapsedTime, inferenceTime: $inferenceTime, preProcessingTime: $preProcessingTime}';
  }
}