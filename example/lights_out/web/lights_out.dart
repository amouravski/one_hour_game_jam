import '../../../lib/one_hour_game_jam.dart';
import '../lib/lights_out.dart';
import 'dart:html';

Grid lightGrid;

main() {

  var myGame = ['101',
                '001',
                '111'];
  lightGrid = _createLightGrid(myGame);
}

/** 
 * Creates a simple light grid given a list of strings encoding the rows.
 * 
 * For example:
 *     [101, 001, 111]
 * creates a grid like:
 *     1 0 1
 *     0 0 1
 *     1 1 1
 */    
Grid _createLightGrid(List<String> grid) {
  var out = new Grid.empty();
  for (int i = 0; i < grid.length; i++) {
    var row = grid[i];
    var gridRow = [];
    for (int j = 0; j < row.length; j++) {
      if (row[j] == '0') {
        gridRow.add(new LightCell(i, j, false));
      } else {
        gridRow.add(new LightCell(i, j, true));
      }
    }
    out.addRow(gridRow);
  }
  return out;
}

lightClick(LightCell cell, Grid grid) {
  print('Clicked $cell');
  var neighbors = grid.neighborsAsList(cell);
  cell.flip();
  
  for (LightCell n in neighbors) {
    print('Neighbor $n');
    n.flip();
  }
}