import '../../../lib/model.dart';
import '../lib/lights_out.dart';
import 'dart:html';

Grid lightGrid;

main() {

  var myGame = ['101',
                '000',
                '111'];
  lightGrid = _createLightGrid(myGame);
}

/** 
 * Creates a simple light grid given a list of strings encoding the rows.
 * 
 * For example:
 *     [101, 000, 111]
 * creates a grid like:
 *     1 0 1
 *     0 0 0
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

handleClick(Event e) {
  print(e.target);
}