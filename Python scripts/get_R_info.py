import csv

def load_source(filename):
    with open(filename, "r") as f:
        reader = csv.reader(f, delimiter=",")
        return list(reader)

sourcecsv = load_source("/Users/bscohen/Downloads/rt_table_export.csv/clean_data/rt_table_export.csv")

NYG_NYJ_MSA = ["Kings, New York", "Queens, New York", "New York, New York", "Bronx, New York", "Richmond, New York", "Westchester, New York", "Bergen, New Jersey", "Hudson, New Jersey", "Passaic, New Jersey", "Putnam, New York", "Rockland, New York", "Suffolk, New York", "Nassau, New York", "Middlesex, New Jersey", "Monmouth, New Jersey", "Ocean, New Jersey", "Somerset, New Jersey", "Essex, New Jersey", "Union, New Jersey", "Morris, New Jersey", "Sussex, New Jersey", "Hunterdon, New Jersey", "Pike, Pennsylvania"]

LAC_LAR_MSA = ["Los Angeles, California", "Orange, California"]

CHI_MSA = ["Cook, Illinois", "DeKalb, Illinois", "DuPage, Illinois", "Grundy, Illinois", "Kankakee, Illinois", "Kane, Illinois", "Kendall, Illinois", "McHenry, Illinois", "Will, Illinois", "Jasper, Indiana", "Lake, Indiana", "Newton, Indiana", "Porter, Indiana", "Lake, Illinois", "Kenosha, Wisconsin"]

DAL_MSA = ["Collin, Texas", "Dallas, Texas", "Denton, Texas", "Ellis, Texas", "Hunt, Texas", "Kaufman, Texas", "Rockwall, Texas", "Johnson, Texas", "Parker, Texas", "Tarrant, Texas", "Wise, Texas"]

HOU_MSA = ["Austin, Texas", "Brazoria, Texas", "Chambers, Texas", "Fort Bend, Texas", "Galveston, Texas", "Harris, Texas", "Liberty, Texas", "Montgomery, Texas", "Waller, Texas"]

WSH_MSA = ["District of Columbia, District of Columbia", "Calvert, Maryland", "Charles, Maryland", "Frederick, Maryland", "Montgomery, Maryland", "Prince George's, Maryland", "Alexandria, Virginia", "Arlington, Virginia", "Clarke, Virginia", "Culpeper, Virginia", "Fairfax, Virginia", "Fairfax City, Virginia", "Falls Church, Virginia", "Fauquier, Virginia", "Fredericksburg, Virginia", "Loudoun, Virginia", "Manassas, Virginia", "Manassas Park, Virginia", "Prince William, Virginia", "Rappahannock, Virginia", "Spotsylvania, Virginia", "Stafford, Virginia", "Warren, Virginia", "Jefferson, West Virginia"]

MIA_MSA = ["Miami-Dade, Florida", "Broward, Florida", "Palm Beach, Florida"]

PHI_MSA = ["Burlington, New Jersey", "Camden, New Jersey", "Gloucester, New Jersey", "Bucks, Pennsylvania", "Chester, Pennsylvania", "Montgomery, Pennsylvania", "Delaware, Pennsylvania", "Philadelphia, Pennsylvania", "New Castle, Delaware", "Cecil, Maryland", "Salem, New Jersey"]

ATL_MSA = ["Fulton, Georgia", "DeKalb, Georgia", "Gwinnett, Georgia", "Cobb, Georgia", "Clayton, Georgia", "Walton, Georgia", "Newton, Georgia", "Douglas, Georgia", "Fayette, Georgia", "Forsyth, Georgia", "Henry, Georgia", "Cherokee, Georgia", "Rockdale, Georgia", "Butts, Georgia", "Barrow, Georgia", "Coweta, Georgia", "Bartow, Georgia", "Carroll, Georgia", "Paulding, Georgia", "Pickens, Georgia", "Spalding, Georgia"]

ARI_MSA = ["Maricopa, Arizona", "Pinal, Arizona", "Gila, Arizona"]

NE_MSA = ["Norfolk, Massachusetts", "Plymouth, Massachusetts", "Suffolk, Massachusetts", "Essex, Massachusetts", "Middlesex, Massachusetts", "Rockingham, New Hampshire", "Strafford, New Hampshire"]

SF_MSA = ["Santa Clara, California", "San Benito, California", "Alameda, California", "Contra Costa, California", "San Francisco, California", "San Mateo, California", "Marin, California"]

DET_MSA = ["Lapeer, Michigan", "Livingston, Michigan", "Macomb, Michigan", "Oakland, Michigan", "St. Clair, Michigan", "Wayne, Michigan"]

SEA_MSA = ["King, Washington", "Pierce, Washington", "Snohomish, Washington"]

MIN_MSA = ["Hennepin, Minnesota", "Ramsey, Minnesota", "Dakota, Minnesota", "Anoka, Minnesota", "Washington, Minnesota", "Scott, Minnesota", "Wright, Minnesota", "Carver, Minnesota", "Sherburne, Minnesota", "St. Croix, Wisconsin", "Chisago, Minnesota", "Pierce, Wisconsin", "Isanti, Minnesota", "Le Sueur, Minnesota", "Mille Lacs, Minnesota", "Sibley, Minnesota"]

TB_MSA = ["Hillsborough, Florida", "Pinellas, Florida", "Hernando, Florida", "Pasco, Florida"]

DEN_MSA = ["Denver, Colorado", "Arapahoe, Colorado", "Jefferson, Colorado", "Adams, Colorado", "Douglas, Colorado", "Broomfield, Colorado", "Elbert, Colorado", "Park, Colorado", "Clear Creek, Colorado", "Gilpin, Colorado"]

BAL_MSA = ["Anne Arundel, Maryland", "Baltimore City, Maryland", "Baltimore, Maryland", "Carroll, Maryland", "Harford, Maryland", "Howard, Maryland", "Queen Anne's, Maryland"]

CHA_MSA = ["Mecklenburg, North Carolina", "York, South Carolina", "Union, North Carolina", "Gaston, North Carolina", "Cabarrus, North Carolina", "Iredell, North Carolina", "Rowan, North Carolina", "Lancaster, South Carolina", "Cleveland, North Carolina", "Lincoln, North Carolina", "Stanly, North Carolina", "Chester, South Carolina"]

PIT_MSA = ["Allegheny, Pennsylvania", "Armstrong, Pennsylvania", "Beaver, Pennsylvania", "Butler, Pennsylvania", "Fayette, Pennsylvania", "Washington, Pennsylvania", "Westmoreland, Pennsylvania"]

LV_MSA = ["Clark, Nevada"]

CIN_MSA = ["Butler, Ohio", "Warren, Ohio", "Hamilton, Ohio", "Clermont, Ohio", "Brown, Ohio", "Dearborn, Indiana", "Ohio, Indiana", "Union, Indiana", "Franklin, Indiana", "Boone, Kentucky", "Bracken, Kentucky", "Campbell, Kentucky", "Gallatin, Kentucky", "Grant, Kentucky", "Kenton, Kentucky", "Pendleton, Kentucky"]

KC_MSA = ["Jackson, Missouri", "Johnson, Kansas", "Clay, Missouri", "Wyandotte, Kansas", "Cass, Missouri", "Platte, Missouri", "Leavenworth, Kansas", "Miami, Kansas", "Lafayette, Missouri", "Ray, Missouri", "Clinton, Missouri", "Bates, Missouri", "Linn, Kansas", "Caldwell, Missouri"]

IND_MSA = ["Marion, Indiana", "Hamilton, Indiana", "Hendricks, Indiana", "Johnson, Indiana", "Madison, Indiana", "Hancock, Indiana", "Morgan, Indiana", "Boone, Indiana", "Shelby, Indiana", "Putnam, Indiana", "Brown, Indiana"]

CLE_MSA = ["Cuyahoga, Ohio", "Geauga, Ohio", "Lake, Ohio", "Lorain, Ohio", "Medina, Ohio"]

TEN_MSA = ["Cannon, Tennessee", "Cheatham, Tennessee", "Davidson, Tennessee", "Dickson, Tennessee", "Hickman, Tennessee", "Macon, Tennessee", "Maury, Tennessee", "Robertson, Tennessee", "Rutherford, Tennessee", "Smith, Tennessee", "Sumner, Tennessee", "Trousdale, Tennessee", "Williamson, Tennessee", "Wilson, Tennessee"]

GB_MSA = ["Brown, Wisconsin", "Kewaunee, Wisconsin", "Oconto, Wisconsin"]

JAX_MSA = ["Duval, Florida", "St. Johns, Florida", "Clay, Florida", "Nassau, Florida", "Baker, Florida"]

NO_MSA = ["Jefferson, Louisiana", "Orleans, Louisiana", "Plaquemines, Louisiana", "St. Bernard, Louisiana", "St. Charles, Louisiana", "St. John the Baptist, Louisiana", "St. Tammany, Louisiana", "St. James, Louisiana"]

BUF_MSA = ["Erie, New York", "Niagara, New York"]

stadium_counties = ["Bergen, New Jersey", "Los Angeles, California", "Cook, Illinois", "Tarrant, Texas", "Harris, Texas", "Prince George's, Maryland", "Miami-Dade, Florida", "Philadelphia, Pennsylvania", "Fulton, Georgia", "Maricopa, Arizona", "Norfolk, Massachusetts", "Santa Clara, California", "Wayne, Michigan", "King, Washington", "Hennepin, Minnesota", "Hillsborough, Florida", "Denver, Colorado", "Baltimore City, Maryland", "Mecklenburg, North Carolina", "Allegheny, Pennsylvania", "Clark, Nevada", "Hamilton, Ohio", "Jackson, Missouri", "Marion, Indiana", "Cuyahoga, Ohio", "Davidson, Tennessee", "Brown, Wisconsin", "Duval, Florida", "Orleans, Louisiana", "Erie, New York"]

for county in BUF_MSA:
    county_slice = county.split(",")[0]
    fname = county_slice.lower() + "_county.csv"
    fpath = "/Users/bscohen/Desktop/stats paper/resources/county CSV files/%s" % fname
    with open(fpath, mode="w") as stadium_file:
        stadium_writer = csv.writer(stadium_file, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL)
        stadium_writer.writerow(["Date", "Rt", "Rt upper", "Rt lower"])
        for row in sourcecsv:
            if row[1] == county and int(float(row[5])) >= 0:
                stadium_writer.writerow([row[4], row[5], row[6], row[7]]) # county, date, R_t
            elif row[1] == county and int(float(row[5])) < 0:
                stadium_writer.writerow([row[4], "", "", ""])  

# row[6] is upper limit of CI, row[7] is lower limit of CI
# row[13] is 7-day rolling average; row[14] is per capita