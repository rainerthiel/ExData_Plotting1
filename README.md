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

Descriptions of the 9 variables in the dataset can be found at the
<a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

## Loading the data

Note the following considerations:

-   Size of the dataset Rough size calculation: \# rows \* \# columns \*
    8 bytes / 2\^20 = 142.5MB - easily handled on any machine upward of
    4GB RAM. **colClasses** - can be specified to speed up reading a
    large dataset.

<!-- -->

-   Missing values are coded as `?`. in the input file. These are
    converted to NA when the file is read into the data frame, i.e.
    `read.table(... na.strings = '?')`

-   The download, file import and data cleaning code is common to all 4
    plotting scripts. It is located in the common helper script
    `Helpers.R` function `getData()`

-   The imported data subset selection defaults to the dates as
    specified in the project instructions. This can be overridden by
    passing a different date range into the helper function using the
    optional `from=` and `to=` arguments. Example:
    `getData(sourceUrl, sourceFile, target, from="2008-03-07", to="2008-03-09")`

-   Note though that with bigger date ranges the plots don't scale that
    well. The legend in Plot3 for example overlaps the plot itself.
    Also, no parameter checking has been done. When you pass in garbage
    dates, or from \>= to, results are um... definitely undefined.
    Anyway, this is all beyond the scope of the project requirements, it
    is just an exercise for me learning the R language.

-   The code is not optimized for performance. Opportunities that may be
    explored include i) importing the required subset of data or ii)
    using colClasses on import.

## Making Plots

For each plot:

-   The plot is constructed and saved as a PNG file with a width of 480
    pixels and a height of 480 pixels.

-   The plot files are named `plot1.png`, `plot2.png`, `plot3.png` and
    `plot4.png`.

-   The plots are coded in a separate R code file named `Plot1.R`,
    `Plot2.R`, `Plot3.R` and `Plot4.R`. They construct the corresponding
    plot file and write it out using the png graphical device. The
    scripts all use a common helper function for reading the data.

#### Note on Plot4

This plot is composed of 4 different plots that are shown that are
rendered as a single graphic. Two of them are the Plot2 and Plot3 plots.
The code that generates these plots is contained in the common helper
script `Helpers.R`
