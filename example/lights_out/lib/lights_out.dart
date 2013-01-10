library lights_out;

//import 'package:one_hour_game_jam/model.dart';
import '../../../lib/one_hour_game_jam.dart';

/// A cell that keeps track of whether it is lit or not.
class LightCell extends Cell {
  bool lit;
  
  LightCell(x, y, this.lit)
      : super(x, y);
  
  /// Flips lit value. Returns previous value.
  bool flip() {
    lit = !lit;
    return !lit;
  }
  
  String toString() {
    return '($x, $y) ${lit ? "+" : "-"}';
  }
}