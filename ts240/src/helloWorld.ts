class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  onXAxis(): boolean {
    return this.y === 0;
  }

  onYAxis(): boolean {
    return this.x === 0;
  }

  distanceToOrigin(): number {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }
}

let point = new Point(3,4);

console.log(point.x)