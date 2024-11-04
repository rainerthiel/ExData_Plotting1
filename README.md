---
editor_options: 
  markdown: 
    wrap: 72
---

## Introduction

(from the Course Project 1 Instructions)

This assignment uses data from the
<a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine Learning
Repository</a>, a popular repository for machine learning datasets. In
particular, we will be using the "Individual household electric power
consumption Data Set" which I have made available on the course web
site:

-   <b>Dataset</b>:
    <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric
    power consumption</a> [20Mb]

-   <b>Description</b>: Measurements of electric power consumption in
    one household with a one-minute sampling rate over a period of
    almost 4 years. Different electrical quantities and some
    sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken
from the
<a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>

<li><b>Date</b>: Date in format dd/mm/yyyy</li>

<li><b>Time</b>: time in format hh:mm:ss</li>

<li><b>Global_active_power</b>: household global minute-averaged active
power (in kilowatt)</li>

<li><b>Global_reactive_power</b>: household global minute-averaged
reactive power (in kilowatt)</li>

<li><b>Voltage</b>: minute-averaged voltage (in volt)</li>

<li><b>Global_intensity</b>: household global minute-averaged current
intensity (in ampere)</li>

<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of
active energy). It corresponds to the kitchen, containing mainly a
dishwasher, an oven and a microwave (hot plates are not electric but gas
powered).</li>

<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of
active energy). It corresponds to the laundry room, containing a
washing-machine, a tumble-drier, a refrigerator and a light.</li>

<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of
active energy). It corresponds to an electric water-heater and an
air-conditioner.</li>

</ol>

## Loading the data

Note the following considerations:

-   Size of the dataset Rough size calculation: \# rows \* \# columns \*
    8 bytes / 2\^20 = 142.5MB - easily handled on my 32GB RAM laptop.
    **colClasses** - can be specified to speed up reading a large
    dataset. Experimented with this and found an improvement of around
    4s (22s without) so decided it wasn't worth it.

Details see this [simplystatistics]
(<http://simplystatistics.org/2011/10/07/r-workshop-reading-in-large-data-frames/>)
post.

-   Input columns *Date* and *Time* These are automatically converted to
    appropriate classes by specifying *stringsAsFactors=FALSE* when
    reading the file.

-   Missing values are coded as `?`. in the input file. These are
    converted to NA when the file is read into the data frame, i.e.
    `read.table(... na.strings = '?')`

## Making Plots

For each plot:

-   The plot is constructed and saved as a PNG file with a width of 480
    pixels and a height of 480 pixels.

-   The plot files are named `plot1.png`, `plot2.png`, `plot3.png` and
    `plot4.png`.

-   The plots are coded in a separate R code file named `plot1.R`,
    `plot2.R`, `plot3.R` and `plot4.R`. They construct the corresponding
    plot file and write it out using the png graphical device.
    The scripts all use a common helper function for reading the data.
