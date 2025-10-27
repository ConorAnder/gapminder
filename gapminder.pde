// Colours from coolers.co
color grid_line_colour = color(120, 120, 120);
color black = color(0, 0, 0);
color transparent = color(0, 100, 200, 150);
color green = color(64, 197, 117, 150);
color low_pop = color(255, 0, 0, 150);
color hi_pop = color(0, 255, 0, 150);

color asia_colour = color(173, 216, 230, 150);
color europe_colour = color(255, 182, 193, 150);
color africa_colour = color(255, 255, 204, 150);
color americas_colour = color(200, 180, 255, 150);
color oceania_colour = color(255, 160, 160, 150);
color ireland_colour = color(180, 230, 200, 150);


PShape ireland;

int border = 80;

void setup() {
    size(700, 700);
    background(255, 255, 255);

    // SVGs
    ireland = loadShape("ireland.svg");
    ireland.disableStyle();

    // Insert data into a table
    Table data = loadTable("gapminder.csv", "header");
    // Gather data
    ArrayList<dataPoint> data_points = getData(data);
    print("There are " + str(data.getRowCount()) + " rows in the table\n");

    data_points.sort((a, b) -> Float.compare(b.gdp, a.gdp));
    print("The highest gdp is " + str(data_points.get(0).gdp) + " and the lowest is " + data_points.get(data.getRowCount() - 1).gdp + "\n");

    // Objectives
    plotB1(data_points);

    // Graph plotting
    plotAxes();
}