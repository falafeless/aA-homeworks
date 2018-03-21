document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById('mycanvas');
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext('2d');
  ctx.fillStyle = 'rgb(140, 66, 244)';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(canvasEl.width/2, canvasEl.height/2, canvasEl.width/2 - 10, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'rgb(110, 36, 214)';
  ctx.stroke();

  ctx.fillStyle = 'rgb(130, 56, 234)';
  ctx.fill();


  ctx.beginPath();

  ctx.arc(75, 75, 50, 0, Math.PI * 2, true); // Outer circle
  ctx.moveTo(110, 75);
  ctx.arc(75, 75, 35, 0, Math.PI, false);  // Mouth (clockwise)
  ctx.moveTo(65, 65);
  ctx.arc(60, 65, 5, 0, Math.PI * 2, true);  // Left eye
  ctx.moveTo(95, 65);
  ctx.arc(90, 65, 5, 0, Math.PI * 2, true);  // Right eye
  ctx.strokeStyle = "orange";
  ctx.stroke();

  ctx.beginPath();
  ctx.bezierCurveTo(75, 37, 70, 25, 50, 25);
  ctx.bezierCurveTo(20, 25, 20, 62.5, 20, 62.5);
  ctx.bezierCurveTo(20, 80, 40, 102, 75, 120);
  ctx.bezierCurveTo(110, 102, 130, 80, 130, 62.5);
  ctx.bezierCurveTo(130, 62.5, 130, 25, 100, 25);
  ctx.bezierCurveTo(85, 25, 75, 37, 75, 40);
  ctx.fillStyle = "green";
  ctx.fill();
});
