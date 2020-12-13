import csv

def load_source(filename):
    with open(filename, "r") as f:
        reader = csv.reader(f, delimiter=",")
        return list(reader)

sourcecsv = load_source("/Users/bscohen/Downloads/rt_table_export.csv/clean_data/rt_table_export.csv")

states = ["Alabama, USA", "Alaska, USA", "Arizona, USA", "Arkansas, USA", "California, USA", "Colorado, USA", "Connecticut, USA", "Delaware, USA", "District of Columbia, USA", "Florida, USA", "Georgia, USA", "Hawaii, USA", "Idaho, USA", "Illinois, USA", "Indiana, USA", "Iowa, USA", "Kansas, USA", "Kentucky, USA", "Louisiana, USA", "Maine, USA", "Maryland, USA", "Massachusetts, USA", "Michigan, USA", "Minnesota, USA", "Mississippi, USA", "Missouri, USA", "Montana, USA", "Nebraska, USA", "Nevada, USA", "New Hampshire, USA", "New Jersey, USA", "New Mexico, USA", "New York, USA", "North Carolina, USA", "North Dakota, USA", "Ohio, USA", "Oklahoma, USA", "Oregon, USA", "Pennsylvania, USA", "Rhode Island, USA", "South Carolina, USA", "South Dakota, USA", "Tennessee, USA", "Texas, USA", "Utah, USA", "Vermont, USA", "Virginia, USA", "Washington, USA", "West Virginia, USA", "Wisconsin, USA", "Wyoming, USA"]

for state in states:
    state_slice = state.split(",")[0]
    fname = state_slice + ".csv"
    fpath = "/Users/bscohen/Desktop/stats paper/resources/county CSV files/%s" % fname
    with open(fpath, mode="w") as stadium_file:
        stadium_writer = csv.writer(stadium_file, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL)
        stadium_writer.writerow(["Date", "Rt", "Rt upper", "Rt lower"])
        for row in sourcecsv:
            if row[1] == state and int(float(row[5])) >= 0:
                stadium_writer.writerow([row[4], row[5], row[6], row[7]]) # county, date, R_t
            elif row[1] == state and int(float(row[5])) < 0:
                stadium_writer.writerow([row[4], "", "", ""])

# row[6] is upper limit of CI, row[7] is lower limit of CI
# row[13] is 7-day rolling average; row[14] is per capita