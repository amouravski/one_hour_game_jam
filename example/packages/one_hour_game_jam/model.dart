library model;

/// The grid that will display the game.
class Grid {
  final List<List<Cell>> _model;
  final int width;
  final int height;
  
  /// Creates a new grid of width [x], and height [y].
  Grid(width, this.height)
      : _model = new List<List<Cell>>(width),
        this.width = width {
    for (List<Cell> x in _model) {
      x = new List<Cell>(this.height);
    }
  }
  
  /** 
   * Returns the [x]th column.
   * 
   * Best if used with another `[]` to specify the exact `[x][y]` coordinate:
   * 
   *     // Get cell (5, 10)
   *     Cell myCell = myGrid[5][10];
   */
  List<Cell> operator[](int x) {
    return _model[x];
  }

  /// Returns true if the coordinate pair is a valid location on the grid.
  bool _isCellValid(int x, int y) {
    return x > 0 && y > 0 &&
        x < width && y < height &&
        this[x][y].isValid();
  }
  
  
  /**
   * Returns a map of a [cell]'s neighbors keyed on their grid position.
   * 
   * [diagonal] is used to allow neighbors on the diagonal.
   */
  Map<Point, Cell> neighbors(Cell cell, {bool diagonal: false}) {
    var out = new Map<Point, Cell>();
    
    for (int x = cell.x - 1; x < cell.x + 1; x++) {
      for (int y = cell.y - 1; y < cell.y + 1; y++) {
        if (diagonal == false && x == y) {
          continue;
        } else if (_isCellValid(x, y)) {
          out.putIfAbsent(new Point(x, y), () {return this[x][y];});
        }
      }
    }
    
    return out;
  }
  
  /// Returns a list of a [cell]'s neighbors.
  List<Cell> neighborsAsList(Cell cell, {bool diagonal: false}) {
    return neighbors(cell, diagonal: diagonal).values;
  }
}

/// One item in the grid.
class Cell {
  final int x;
  final int y;
  
  Cell(this.x, this.y);
  
  /// Override this to allow cell to be skipped as neighbors.
  bool isValid() {
    return true;
  }
}

/// A simple [x], [y] coordinate pair.
class Point {
  final int x;
  final int y;
  
  Point(this.x, this.y);
}