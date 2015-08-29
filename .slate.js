// Operations

S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});


var lapFull = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var moveBig = S.op("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY",
});
var moveLeft = moveBig.dup({ "width" : "screenSizeX/2" })
var moveRight = moveBig.dup({ "x": "screenSizeX/2", "width" : "screenSizeX/2" });
var moveTop = moveBig.dup({ "height" : "screenSizeY/2" });
var moveBottom = moveBig.dup({ "y": "screenSizeY/2", "height" : "screenSizeY/2" });

var moveTopLeft = moveLeft.dup({"height": "screenSizeY/2"});
var moveTopRight = moveRight.dup({"height": "screenSizeY/2"});

var moveBottomRight = moveRight.dup({"y": "screenSizeY/2", "height": "screenSizeY/2"});
var moveBottomLeft = moveLeft.dup({"y": "screenSizeY/2", "height": "screenSizeY/2"});

S.bnda({
  'space:ctrl': lapFull,
  'p:ctrl;cmd': moveTopLeft,
  '[:ctrl;cmd': moveTop,
  ']:ctrl;cmd': moveTopRight,
  'l:ctrl;cmd': moveLeft,
  '\':ctrl;cmd': moveRight,
  ',:ctrl;cmd': moveBottomLeft,
  '.:ctrl;cmd': moveBottom,
  '/:ctrl;cmd': moveBottomRight
});
