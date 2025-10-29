void plotA1(ArrayList<dataPoint> data_points) {
    plotGridLines(10);
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    float max_gdp = (float)Math.log10(data_points.get(0).gdp), min_gdp = (float)Math.log10(data_points.get(data_points.size() - 1).gdp);

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;
    
    data_points.sort((a, b) -> Float.compare(b.population, a.population));
    float max_pop = data_points.get(0).population, min_pop = data_points.get(data_points.size() - 1).population;

    // Plot
    fill(transparent);
    strokeWeight(1);
    ArrayList<PVector> ireland_points = new ArrayList<PVector>();
    for (dataPoint dp : data_points) {
        if (dp.year == 2002) {
            float size = map(dp.population, min_pop, max_pop, 5, 80);
            float ireland_scale = map(dp.population, min_pop, max_pop, 0.01, 0.1);
            float x = map((float)Math.log10(dp.gdp), min_gdp, max_gdp, 1.5 * border, width - 1.5 * border);
            float y = map(dp.life_expectancy, min_le, max_le, height -  1.5 * border, 1.5 * border);
            
            noStroke();
            if (dp.country.contains("Ireland")) {
                ireland_points.add(new PVector(x, y, ireland_scale));
            }
            else {
                ellipse(x, y, size, size);
            }
        }  
    }

    // Plot Ireland SVGs
    stroke(black);
    fill(green);
    strokeWeight(20);
    for (PVector point : ireland_points) {
        pushMatrix();
        translate(point.x, point.y);
        scale(point.z);
        shape(ireland, -ireland.width/2, -ireland.height/2);
        popMatrix();
    }
    plotAxisTitles("GDP", "Life Expectancy");
    plotAxisMarkersA(data_points);
    plotChartTitle("Chart A1 - Population as Size");
}

void plotA2(ArrayList<dataPoint> data_points) {
    plotGridLines(10);
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    float max_gdp = (float)Math.log10(data_points.get(0).gdp), min_gdp = (float)Math.log10(data_points.get(data_points.size() - 1).gdp);

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;
    
    data_points.sort((a, b) -> Float.compare(b.population, a.population));
    float max_pop = data_points.get(0).population, min_pop = data_points.get(data_points.size() - 1).population;

    // Plot
    for (dataPoint dp : data_points) {
        if (dp.year == 2002) {
            float x = map((float)Math.log10(dp.gdp), min_gdp, max_gdp, 1.5 * border, width - 1.5 * border);
            float y = map(dp.life_expectancy, min_le, max_le, height -  1.5 * border, 1.5 * border);
            float saturation = map(dp.population, min_pop, max_pop, 150, 255);
            
            if (dp.country.contains("Ireland")) {
                stroke(black);
                fill(64, 197, 117, saturation);
                strokeWeight(20);
                pushMatrix();
                translate(x, y);
                scale(0.01);
                shape(ireland, -ireland.width/2, -ireland.height/2);
                popMatrix();
            }
            else {
                fill(0, 100, 200, saturation);
                noStroke();
                ellipse(x, y, 5, 5);
            }
        }
    }

    plotAxisTitles("GDP", "Life Expectancy");
    plotAxisMarkersA(data_points);
    plotChartTitle("Chart A2 - Population as Saturation");
}


void plotA3(ArrayList<dataPoint> data_points) {
    plotGridLines(10);
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    float max_gdp = (float)Math.log10(data_points.get(0).gdp), min_gdp = (float)Math.log10(data_points.get(data_points.size() - 1).gdp);

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;
    
    data_points.sort((a, b) -> Float.compare(b.population, a.population));
    float max_pop = data_points.get(0).population, min_pop = data_points.get(data_points.size() - 1).population;

    // Plot
    for (dataPoint dp : data_points) {
        if (dp.year == 2002) {
            float x = map((float)Math.log10(dp.gdp), min_gdp, max_gdp, 1.5 * border, width - 1.5 * border);
            float y = map(dp.life_expectancy, min_le, max_le, height -  1.5 * border, 1.5 * border);
            float colour = map(dp.population, min_pop, max_pop, 0, 1);
            
            if (dp.country.contains("Ireland")) {
                stroke(black);
                fill(lerpColor(low_pop, hi_pop, colour));
                strokeWeight(20);
                pushMatrix();
                translate(x, y);
                scale(0.01);
                shape(ireland, -ireland.width/2, -ireland.height/2);
                popMatrix();
            }
            else {
                fill(lerpColor(low_pop, hi_pop, colour));
                noStroke();
                ellipse(x, y, 10, 10);
            }
        }
    }

    plotAxisTitles("GDP", "Life Expectancy");
    plotAxisMarkersA(data_points);
    plotChartTitle("Chart A3 - Population as Colour Tone");
}

void plotB1(ArrayList<dataPoint> data_points) {
    plotGridLines(13);

    // Get min and max values
    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    int max_y = 2007, min_y = 1952;

    // Plot continent and Ireland points
    String[] continents = {"Asia", "Europe", "Africa", "Americas", "Oceania", "Ireland"};
    ArrayList<continentObj> continent_data = new ArrayList<continentObj>();
    for (String continent : continents) {
        for (int y = 1952; y <= 2007; y += 5) {
            // Differentiate between Ireland and continents
            float avg_le;
            if (continent.equals("Ireland")) {
                avg_le = getAvgLEPYIreland(data_points, y);
            }
            else 
                avg_le = getAverageLEPerYear(data_points, y, continent);

            // Save points for lines later
            continent_data.add(new continentObj(continent, y, avg_le));

            // Map points to graph
            float X = map(y, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y = map(avg_le, min_le, max_le, height - 1.5 * border, 1.5 * border);

            // Choosing colour
            fill(getContinentColour(continent));
            ellipse(X, Y, 10, 10);
        }
    }

    // Plot lines
    strokeWeight(5);
    for (String continent : continents) {
        // Group points by continent / Ireland
        ArrayList<continentObj> points = new ArrayList<continentObj>();
        for (continentObj point : continent_data) {
            if (point.continent.equals(continent)) {
                points.add(point);
            }
        }

        for (int i = 0; i < points.size() - 1; i++) {
            // Map points to graph
            float X_1 = map(points.get(i).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_1 = map(points.get(i).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);
            float X_2 = map(points.get(i + 1).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_2 = map(points.get(i + 1).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);

            stroke(getContinentColour(continent));
            line(X_1, Y_1, X_2, Y_2);
        }
    }

    plotAxisTitles("Year", "Life Expectancy");
    plotAxisMarkersB(data_points, 13);
    plotChartTitle("Chart B1 - Continent as Colour");
    plotB1legend();
}

void plotB2(ArrayList<dataPoint> data_points) {
    plotGridLines(13);

    // Get min and max values
    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    int max_y = 2007, min_y = 1952;

    // Plot continent and Ireland points
    String[] continents = {"Asia", "Europe", "Africa", "Americas", "Oceania", "Ireland"};
    ArrayList<continentObj> continent_data = new ArrayList<continentObj>();
    for (String continent : continents) {
        for (int y = 1952; y <= 2007; y += 5) {
            // Differentiate between Ireland and continents
            float avg_le;
            if (continent.equals("Ireland")) {
                avg_le = getAvgLEPYIreland(data_points, y);
            }
            else 
                avg_le = getAverageLEPerYear(data_points, y, continent);

            // Save points for lines later
            continent_data.add(new continentObj(continent, y, avg_le));

            // Map points to graph
            float X = map(y, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y = map(avg_le, min_le, max_le, height - 1.5 * border, 1.5 * border);

            // Choosing shape
            plotContinentShape(X, Y, continent, 15, black);
            print("The continent being plotted now is " + continent + "\n");
        }
    }

    // Plot lines
    strokeWeight(5);
    for (String continent : continents) {
        // Group points by continent / Ireland
        ArrayList<continentObj> points = new ArrayList<continentObj>();
        for (continentObj point : continent_data) {
            if (point.continent.equals(continent)) {
                points.add(point);
            }
        }

        for (int i = 0; i < points.size() - 1; i++) {
            // Map points to graph
            float X_1 = map(points.get(i).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_1 = map(points.get(i).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);
            float X_2 = map(points.get(i + 1).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_2 = map(points.get(i + 1).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);

            stroke(black);
            strokeWeight(2);
            line(X_1, Y_1, X_2, Y_2);
        }
    }

    plotAxisTitles("Year", "Life Expectancy");
    plotAxisMarkersB(data_points, 13);
    plotChartTitle("Chart B2 - Continent as Shape");
    plotB2legend();
}

void plotB3(ArrayList<dataPoint> data_points) {
    plotGridLines(13);

    // Get min and max values
    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    int max_y = 2007, min_y = 1952;

    // Plot continent and Ireland points
    String[] continents = {"Asia", "Europe", "Africa", "Americas", "Oceania", "Ireland"};
    ArrayList<continentObj> continent_data = new ArrayList<continentObj>();
    for (String continent : continents) {
        for (int y = 1952; y <= 2007; y += 5) {
            // Differentiate between Ireland and continents
            float avg_le;
            if (continent.equals("Ireland")) {
                avg_le = getAvgLEPYIreland(data_points, y);
            }
            else 
                avg_le = getAverageLEPerYear(data_points, y, continent);

            // Save points for lines later
            continent_data.add(new continentObj(continent, y, avg_le));

            // Map points to graph
            float X = map(y, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y = map(avg_le, min_le, max_le, height - 1.5 * border, 1.5 * border);

            // Choosing size
            int size = getContinentSize(continent);
            ellipse(X, Y, size, size);
            print("The continent being plotted now is " + continent + "\n");
        }
    }

    // Plot lines
    strokeWeight(5);
    for (String continent : continents) {
        // Group points by continent / Ireland
        ArrayList<continentObj> points = new ArrayList<continentObj>();
        for (continentObj point : continent_data) {
            if (point.continent.equals(continent)) {
                points.add(point);
            }
        }

        for (int i = 0; i < points.size() - 1; i++) {
            // Map points to graph
            float X_1 = map(points.get(i).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_1 = map(points.get(i).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);
            float X_2 = map(points.get(i + 1).year, min_y, max_y, 1.5 * border, width - 1.5 * border);
            float Y_2 = map(points.get(i + 1).life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);

            stroke(black);
            strokeWeight(2);
            line(X_1, Y_1, X_2, Y_2);
        }
    }

    plotAxisTitles("Year", "Life Expectancy");
    plotAxisMarkersB(data_points, 13);
    plotChartTitle("Chart B3 - Continent as Size");
    plotB3legend();
}

void plotC(ArrayList<dataPoint> data_points) {
    plotGridLines(13);

    // Get min and max values
    data_points.sort((a, b) -> Float.compare(b.population, a.population));
    float max_pop = data_points.get(0).population, min_pop = data_points.get(data_points.size() - 1).population;

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    int max_y = 2007, min_y = 1952;

    // Get all GDP values for colour sorting
    float[] gdp_values = new float[data_points.size()];
    for (int i = 0; i < data_points.size(); i++) {
        gdp_values[i] = data_points.get(i).gdp;
    }
    sort(gdp_values);

    // Find quartiles for colour sorting
    float q1 = gdp_values[(int)(0.25 * gdp_values.length)];
    float q2 = gdp_values[(int)(0.50 * gdp_values.length)];
    float q3 = gdp_values[(int)(0.75 * gdp_values.length)];

    for (dataPoint dp : data_points) {
        float x = map(dp.year, min_y, max_y, 1.5 * border, width - 1.5 * border);
        x = random(x - 10, x + 10);
        float y = map(dp.life_expectancy, min_le, max_le, height - 1.5 * border, 1.5 * border);
        int size = (int)map(dp.population, min_pop, max_pop, 8, 20);
        int colour = getGDPColour(dp, q1, q2, q3);

        if(!dp.country.equals("Ireland")) {
            plotContinentShape(x, y, dp.continent, size, colour);
        }
        else {
            stroke(colour);
            fill(colour);
            plotContinentShape(x, y, "Ireland", size, colour);
        }
    }

    plotAxisTitles("Year", "Life Expectancy");
    plotAxisMarkersB(data_points, 13);
    plotChartTitle("Chart C - Population as Size");
    plotClegend();
}