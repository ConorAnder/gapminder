color grid_line_colour = color(120, 120, 120);
color black = color(0, 0, 0);

int border = 80;

void setup() {
    size(700, 700);
    background(255, 255, 255);

    // Insert data into a table
    Table data = loadTable("gapminder.csv", "header");
    print("There are " + str(data.getRowCount()) + " rows in the table\n");

    // Graph plotting
    plotGridLines();
    plotAxes();
    plotXAxis("Test");
}