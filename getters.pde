float[] getFloats(Table data, int size, String column) {
  float[] f = new float[size];
  for(int i = 0; i < size; i++) {
    f[i] = data.getFloat(i, column);
  }
  return f;
}

String[] getStrings(Table data, int size, String column) {
  String[] s = new String[size];
  for(int i = 0; i < size; i++) {
    s[i] = data.getString(i, column);
  }
  return s;
}

ArrayList<dataPoint> getData(Table data) {
    ArrayList<dataPoint> dps = new ArrayList<dataPoint>();
    for (int i = 0; i < data.getRowCount(); i++) {
        String country = data.getString(i, "country");
        String continent = data.getString(i, "continent");
        int year = int(data.getFloat(i, "year"));
        float life_expectancy = data.getFloat(i, "lifeExp");
        int population = int(data.getFloat(i, "pop"));
        float gdp = data.getFloat(i, "gdpPercap");
        dps.add(new dataPoint(country, continent, year, life_expectancy, population, gdp));
    }

    return dps;
}

float getAverageLEPerYear(ArrayList<dataPoint> data_points, int year, String continent) {
  double sum = 0;
  int i = 0;
  for (dataPoint dp : data_points) {
    if (dp.continent.equals(continent) && dp.year == year) {
      sum += dp.life_expectancy;
      i++;
    }
  }
  return (float)(sum / i);
}

float getAvgLEPYIreland(ArrayList<dataPoint> data_points, int year) {
  double sum = 0;
  int i = 0;
  for (dataPoint dp : data_points) {
    if (dp.country.equals("Ireland") && dp.year == year) {
      sum += dp.life_expectancy;
      i++;
    }
  }
  return (float)(sum / i);
}

color getContinentColour(String continent) {
  switch(continent) {
     
  }
}

