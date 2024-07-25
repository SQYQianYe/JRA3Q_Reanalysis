# Use wget download JRA3Q reanalysis data
### Download JRA3Q reanalysis data code

- JMA is currently conducting the Japanese Reanalysis for Three Quarters of a Century (JRA-3Q), which covers the period from September 1947 onward to extend the current period of data coverage and improve the quality of long-term reanalysis. The project involves a sophisticated data assimilation system (based on the operational set-up as of December 2018) incorporating development results from the operational NWP system and sea surface temperature analysis achieved since JRA-55 (based on the operational set-up as of December 2009). New datasets of past observations are also assimilated, including rescued historical observations and reprocessed satellite data supplied by meteorological and satellite centers worldwide. Many of the deficiencies of JRA-55 are alleviated in JRA-3Q, providing a high-quality homogeneous reanalysis dataset that covers the previous 75 years.

## DownLoad_JRA3Q_anl125_Pressure_Level.sh
- download JRA-3Q 1.25 degree isobaric analysis fields (anl_p125)

Below is the list of variable codes used in the script `DownLoad_JRA3Q_anl125_Pressure_Level.sh`, along with their respective GRIB variable names and descriptions based on the provided images and the official JRA-3Q documentation.

| Variable Code in Script          | Variable Name             | Description                                                  |
|-----------------------------------|---------------------------------|--------------------------------------------------------------|
| `0_0_0.tmp2m-hgt-an-LL125`       | `2m temperature`               | Temperature at 2 meters above the ground (K)               |
| `0_0_2.pot-sfc-an-Ll125`         | `Potential temperature`        | Potential temperature at the surface                       |
| `0_0_7.depr2m-hgt-an-Ll125`      | `Dewpoint depression`          | Dewpoint depression at 2 meters (K)                        |
| `0_194_6.snleng-sfc-an-Ll125`    | `Snow depth`                   | Snow depth at the surface                                  |
| `0_194_7.snlh2o-sfc-an-Ll125`    | `Snow water equivalent`        | Snow water equivalent at the surface                       |
| `0_1_0.spfh2m-hgt-an-Ll125`      | `Specific humidity`            | Specific humidity at 2 meters                              |
| `0_1_1.rh2m-hgt-an-Ll125`        | `Relative humidity`            | Relative humidity at 2 meters (%)                          |
| `0_1_13.weasd-sfc-an-Ll125`      | `Precipitable water`           | Precipitable water at the surface                          |
| `o_1_64.tciwv-col-an-ll125`      | `Total column integrated water vapor` | Total column integrated water vapor                     |
| `0_3_0.pres-sfc-an-Ll125`        | `Surface pressure`             | Surface pressure                                          |
| `0_2_3.vgrd10m-hgt-an-Ll125`     | `Vertical wind gradient`       | Vertical gradient of wind at 10 meters                    |
| `0_2_2.ugrd10m-hgt-an-Ll125`     | `U-component of wind`          | U-component of wind at 10 meters (m/s)                     |
| `0_3_1.prmsl-msl-an-Ll125`       | `Mean sea level pressure`      | Mean sea level pressure                                    |


**Note:** The saturated vapor pressure used to calculate dewpoint depression (or deficit) and relative humidity from specific humidity is determined by the temperature.
## DownLoad_JRA3Q_anl_surf125.sh
- download JRA-3Q 1.25 degree surface analysis fields (anl_surf125)

## DownLoad_JRA3Q_fcst_phyp125.sh
- download JRA-3Q 1.25 degree isobaric average diagnostic fields (fcst_phyp125)

## DownLoad_JRA3Q_fcst_phy2m125.sh
- download JRA-3Q 1.25 degree two-dimensional average diagnostic fields (fcst_phy2m125)

## Data Resolution
- grid:1.25° x 1.25° from 0E to 358.75E and 90N to 90S (288 x 145 Longitude/Latitude)
- time:3 hour
- level: 45(0.01 to 1000 hPa)

## Notice
- The downloaded data covers the period from 1948 to 2023. To obtain data for the months of September to December in 1947 or from January 2024 to the present, you will need to modify the year loop in the shell (.sh) scripts accordingly.

## Contact Information
- If you encounter any issues or bugs while downloading the data, please do not hesitate to contact me for assistance. My email address is: **suqianye2000@gmail.com**
