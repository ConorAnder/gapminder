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

void plotXAxis(String title) {
    textAlign(CENTER);
    textSize(20);
    fill(black);
    text(title, width / 2, height - (border / 2));
}