import csv

def load_source(filename):
    with open(filename, "r") as f:
        reader = csv.reader(f, delimiter=",")
        return list(reader)

sourcecsv = load_source("/Users/bscohen/Downloads/rt_table_export.csv/clean_data/rt_table_export.csv")

stadium_counties = ["Bergen, New Jersey", "Los Angeles, California", "Cook, Illinois", "Tarrant, Texas", "Harris, Texas", "Prince George's, Maryland", "Miami-Dade, Florida", "Philadelphia, Pennsylvania", "Fulton, Georgia", "Maricopa, Arizona", "Norfolk, Massachusetts", "Santa Clara, California", "Wayne, Michigan", "King, Washington", "Hennepin, Minnesota", "Hillsborough, Florida", "Denver, Colorado", "Baltimore City, Maryland", "Mecklenburg, North Carolina", "Allegheny, Pennsylvania", "Clark, Nevada", "Hamilton, Ohio", "Jackson, Missouri", "Marion, Indiana", "Cuyahoga, Ohio", "Davidson, Tennessee", "Brown, Wisconsin", "Duval, Florida", "Orleans, Louisiana", "Erie, New York"]

fname = "stadium_counties.csv"
fpath = "/Users/bscohen/Desktop/stats paper/resources/county CSV files/%s" % fname

with open(fpath, mode="a") as stadium_file:
    stadium_writer = csv.writer(stadium_file, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL)
    stadium_writer.writerow(["Date", "Rt", "Rt upper", "Rt lower"])
#with open(fpath, mode="a") as stadium_file:
    for county in stadium_counties:
        for row in sourcecsv:
            if row[1] == county and row[2] == "2020-12-07":
                stadium_writer.writerow([row[1], row[5], row[6], row[7]])

# row[6] is upper limit of CI, row[7] is lower limit of CI
# row[13] is 7-day rolling average; row[14] is per capita