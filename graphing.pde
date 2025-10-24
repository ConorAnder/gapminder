void plotGridLines() {
    strokeWeight(1);
    stroke(grid_line_colour);
    for (int i = border; i <= width - border; i += (width - 2 * border) / 10.0) {
        line(border, i, height - border, i);
        line(i, border, i, width - border);
    }
}

void plotAxes() {
    strokeWeight(3);
    stroke(black);
    line(border, height - border, height - border, height - border);
    line(border, border, border, width - border);
}

void plotAxisTitles(String title_1, String title_2) {
    textAlign(CENTER, BOTTOM);
    textSize(20);
    fill(black);
    
    // X axis
    text(title_1, width / 2, height - (border / 2));

    // Y axis
    int x = border / 2;
    int y = height / 2;
    pushMatrix();
    translate(x, y);
    rotate(-HALF_PI);
    text(title_2, 0, 0);
    popMatrix();
}