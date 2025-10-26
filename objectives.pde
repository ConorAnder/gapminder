void plotA1(ArrayList<dataPoint> data_points) {
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
    plotChartTitle("Chart A1 - Population as Size");
}

void plotA2(ArrayList<dataPoint> data_points) {
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
    plotChartTitle("Chart A2 - Population as Saturation");
}