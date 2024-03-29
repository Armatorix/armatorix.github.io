
var streams = [];
var fadeInterval = 1;
var symbolSize = 48;
var symbolStep = 24;
function setup() {
  createCanvas(
    window.innerWidth - 20,
    document.body.offsetHeight * 2
  );
  background(0);

  var x = 0;
  for (var i = 0; i <= width / symbolSize; i++) {
    var stream = new Stream();
    stream.generateSymbols(x, random(-2000, 0));
    streams.push(stream);
    x += symbolSize
  }

  textFont('Consolas');
  textSize(symbolSize);
}

function windowResized() {
  resizeCanvas(
    window.innerWidth - 20,
    document.body.offsetHeight * 2
  );
}

function draw() {
  background(0, 150);
  streams.forEach(function (stream) {
    stream.render();
  });
}

function Symbol(x, y, speed, first, opacity) {
  this.x = x;
  this.y = y;
  this.value;

  this.speed = speed;
  this.first = first;
  this.opacity = opacity;

  this.switchInterval = round(random(20, 80));

  this.setToRandomSymbol = function () {
    if (frameCount % this.switchInterval == 0) {
      // set it to Katakana
      this.value = String.fromCharCode(
        0x30A0 + round(random(0, 96))
      );

    }
  }

  this.rain = function () {
    this.y = (this.y >= height) ? 0 : this.y += this.speed;
  }

}

function Stream() {
  this.symbols = [];
  this.totalSymbols = round(random(21, 37));
  this.speed = random(1, 10);

  this.generateSymbols = function (x, y) {
    var opacity = 255;
    var first = round(random(0, 4)) == 1;
    for (var i = 0; i <= this.totalSymbols; i++) {
      symbol = new Symbol(
        x,
        y,
        this.speed,
        first,
        opacity
      );
      symbol.setToRandomSymbol();
      this.symbols.push(symbol);
      opacity -= (255 / this.totalSymbols) / fadeInterval;
      y -= symbolSize;
      first = false;
    }
  }

  this.render = function () {
    this.symbols.forEach(function (symbol) {
      if (symbol.first) {
        fill(140, 255, 170, symbol.opacity);
      } else {
        fill(0, 255, 70, symbol.opacity);
      }
      text(symbol.value, symbol.x, steping(symbol.y,symbolStep));
      symbol.rain();
      symbol.setToRandomSymbol();
    });
  }
}

function steping(x,y) {
  return x-x%y
}