void plotA1(ArrayList<dataPoint> data_points) {
    // Get mins and maxes for mapping
    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    float max_gdp = (float)Math.log10(data_points.get(0).gdp), min_gdp = (float)Math.log10(data_points.get(data_points.size() - 1).gdp);

    data_points.sort((a, b) -> Float.compare(b.life_expectancy, a.life_expectancy));
    float max_le = data_points.get(0).life_expectancy, min_le = data_points.get(data_points.size() - 1).life_expectancy;

    // Plot
    for (dataPoint dp : data_points) {
        float x = map((float)Math.log10(dp.gdp), min_gdp, max_gdp, 1.5 * border, width - 1.5 * border);
        float y = map(dp.life_expectancy, min_le, max_le, height -  1.5 * border, 1.5 * border);
        ellipse(x, y, 1, 1);
    }
    plotAxisTitles("GDP", "Life Expectancy");
    plotChartTitle("Chart A1");
}