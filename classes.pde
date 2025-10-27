class dataPoint {
    String country;
    String continent;
    int year;
    float life_expectancy;
    int population;
    float gdp;

    dataPoint(String c_y, String c_t, int y, float l_e, int pop, float g) {
        country = c_y;
        continent = c_t;
        year = y;
        life_expectancy = l_e;
        population = pop;
        gdp = g;
    }
}

class continentObj {
    String continent;
    int year;
    float life_expectancy;

    continentObj(String cont, int y, float le) {
        continent = cont;
        year = y;
        life_expectancy = le;
    }
}