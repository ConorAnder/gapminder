void target(float x, float y, int size) {
    noStroke();
    fill(black);
    ellipse(x, y, size, size);

    fill(255, 255, 255);
    ellipse(x, y, 2.0 * size / 3, 2.0 * size / 3);

    fill(black);
    ellipse(x, y, size / 3.0, size / 3.0);
}

void plus(float x, float y, int size) {
    strokeWeight(size / 3);
    stroke(black);
    line(x - 5 * size / 12, y, x + 5 * size / 12, y);
    line(x, y - 5 * size / 12, x, y + 5 * size / 12);
}

void cross(float x, float y, int size) {
    strokeWeight(size / 4);
    stroke(black);
    line(x - 5 * size / 12, y + 5 * size / 12, x + 5 * size / 12, y - 5 * size / 12);
    line(x + 5 * size / 12, y + 5 * size / 12, x - 5 * size / 12, y - 5 * size / 12);
}

void rhombus(float x, float y, int size) {
    stroke(black);
    strokeWeight(size / 4);
    noFill();
    beginShape();
    vertex(x, y - size / 2);
    vertex(x + size / 2, y);
    vertex(x, y + size / 2);
    vertex(x - size / 2, y);
    endShape(CLOSE);
}