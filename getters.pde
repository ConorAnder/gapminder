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