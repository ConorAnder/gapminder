void plotGridLines(int divisions) {
    strokeWeight(1);
    stroke(grid_line_colour);
    float space = (width - 2 * border) / (float)divisions;
    for (int i = 0; i <= divisions; i++) {
        line(border, border + i * space, height - border, border + i * space);
        line(border + i * space, border, border + i * space, width - border);
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

void plotChartTitle(String title) {
    textAlign(CENTER, TOP);
    textSize(30);
    fill(black);
    text(title, width / 2, border / 2);
}

void plotAxisMarkersA(ArrayList<dataPoint> data_points) {
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    float max_gdp = (float)Math.log10(data_points.get(0).gdp), min_gdp = (float)Math.log10(data_points.get(data_points.size() - 1).gdp);

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    // Plot X Axis
    textAlign(CENTER, BOTTOM);
    textSize(11);
    fill(black);
    for (float x = border + (width - 2 * border) / 10.0; x <= width - border; x += (width - 2 * border) / 10.0) {
        float i =  (float)Math.pow(10, map(x, 1.5 * border, width - 1.5 * border, min_gdp, max_gdp));
        text(str(round(i / 100.0) * 100), x, height - border + 15);
    }

    // Plot Y Axis
    for (float y = height - border - (height - 2 * border) / 10.0; y >= border; y -= (height - 2 * border) / 10.0) {
        int i =  (int)map(y, height - 1.5 * border, 1.5 * border, min_le, max_le);
        int x = border - 15;
        pushMatrix();
        translate(x, y);
        rotate(-HALF_PI);
        text(str(i), 0, 0);
        popMatrix();
    }
}

void plotAxisMarkersB(ArrayList<dataPoint> data_points, int divisions) {
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    // Plot X Axis
    textAlign(CENTER, BOTTOM);
    textSize(11);
    fill(black);
    float space = (width - 2 * border) / (float)divisions;
    for (int i = 1; i <= divisions - 1; i++) {
        text(str(1952 + (i - 1) * 5), border + i * space, height - border + 15);
    }

    // Plot Y Axis
    for (int j = 1; j <= divisions - 1; j++) {
        int i =  (int)map(height - border - j * space, height - 1.5 * border, 1.5 * border, min_le, max_le);
        int x = border - 15;
        pushMatrix();
        translate(x, height - border - j * space);
        rotate(-HALF_PI);
        text(str(i), 0, 0);
        popMatrix();
    }
}

void plotB1legend() {
    float left = width - border -  4 * (width - 2 * border) / 13;
    float right = width - border;
    float bottom = height - border;
    float top = height - border - 5 * (width - 2 * border) / 13;

    noStroke();
    fill(255, 255, 255);
    strokeWeight(1);
    rectMode(CORNERS);
    rect(left, bottom, right, top);

    textSize(15);
    textAlign(LEFT, TOP);
    fill(black);
    strokeWeight(15);
    String[] continents = {"Asia", "Europe", "Africa", "Americas", "Oceania", "Ireland"};
    for (int i = 1; i < 7; i++) {
        float y = map(i, 0, 7, bottom, top);
        float x = width - border - 5 * (right - left) / 6;
        text(continents[i - 1], x, y);
        x += 3 * (right - left) / 6;
        stroke(getContinentColour(continents[i - 1]));
        line(x, y + 7, x + 20, y + 7);
    }
}

void plotB2legend() {
    float left = width - border -  4 * (width - 2 * border) / 13;
    float right = width - border;
    float bottom = height - border;
    float top = height - border - 5 * (width - 2 * border) / 13;

    noStroke();
    fill(255, 255, 255);
    strokeWeight(1);
    rectMode(CORNERS);
    rect(left, bottom, right, top);

    textSize(15);
    textAlign(LEFT, TOP);
    fill(black);
    strokeWeight(15);
    String[] continents = {"Asia", "Europe", "Africa", "Americas", "Oceania", "Ireland"};
    for (int i = 1; i < 7; i++) {
        float y = map(i, 0, 7, bottom, top);
        float x = width - border - 5 * (right - left) / 6;
        text(continents[i - 1], x, y);
        x += 3 * (right - left) / 6;
        plotContinentShape(x, y + 8, continents[i - 1], 15, black);
    }
}

void plotB3legend() {
    float left = width - border -  4 * (width - 2 * border) / 13;
    float right = width - border;
    float bottom = height - border;
    float top = height - border - 5 * (width - 2 * border) / 13;

    noStroke();
    fill(255, 255, 255);
    strokeWeight(1);
    rectMode(CORNERS);
    rect(left, bottom, right, top);

    textSize(15);
    textAlign(LEFT, TOP);
    fill(black);
    strokeWeight(15);
    String[] continents = {"Ireland", "Europe", "Oceania", "Americas", "Asia", "Africa"};
    for (int i = 1; i < 7; i++) {
        float y = map(i, 0, 7, bottom, top);
        float x = width - border - 5 * (right - left) / 6;
        text(continents[i - 1], x, y);
        x += 3 * (right - left) / 6;
        int size = getContinentSize(continents[i - 1]);
        ellipse(x, y + 7, size, size);
    }
}

void plotClegend() {
    float left = width - border -  6 * (width - 2 * border) / 13;
    float right = width - border;
    float bottom = height - border;
    float top = height - border - 3 * (width - 2 * border) / 13;

    noStroke();
    fill(255, 255, 255);
    strokeWeight(1);
    rectMode(CORNERS);
    rect(left, bottom, right, top);

    textSize(15);
    textAlign(LEFT, TOP);
    fill(black);
    strokeWeight(15);
    String[] continents = {"Ireland", "Europe", "Oceania", "Americas", "Asia", "Africa"};
    for (int i = 1; i < 7; i++) {
        float y = map(i, 0, 7, bottom, top);
        float x = width - border - 11 * (right - left) / 12;
        text(continents[i - 1], x, y);
        x += 2 * (right - left) / 6;
        plotContinentShape(x, y + 8, continents[i - 1], 15, black);
    }

    String[] gdps = {"Low GDP", "High GDP"};
    for (int i = 1; i < 3; i++) {
        float y = map(i, 0, 3, bottom, top);
        float x = width - border - 6 * (right - left) / 12;
        text(gdps[i - 1], x, y);
        x += 2 * (right - left) / 6;
        if (i == 1) stroke(220, 20, 60);
        else stroke(34, 139, 34);
        line(x + 7, y + 5, x + 17, y + 5);
    }
}

void plotContinentShape(float x, float y, String continent, int size, color colour) {
    switch(continent) {
        case "Asia":
        rectMode(CENTER);
        noFill();
        stroke(colour);
        rect(x, y, size, size);
        break;

        case "Europe":
        cross(x, y, size, colour);
        break;

        case "Africa":
        plus(x, y, size, colour);
        break;

        case "Americas":
        target(x, y, size, colour);
        break;

        case "Oceania":
        rhombus(int(x), int(y), size, colour);
        break;

        case "Ireland":
        fill(colour);
        pushMatrix();
        translate(x, y);
        scale(0.015);
        shape(ireland, -ireland.width/2, -ireland.height/2);
        popMatrix();
        break;

        default:
        ellipse(x, y, size, size);
        break;
    }
}