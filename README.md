# Use wget download JRA3Q reanalysis data
### Download JRA3Q reanalysis data code

- JMA is currently conducting the Japanese Reanalysis for Three Quarters of a Century (JRA-3Q), which covers the period from September 1947 onward to extend the current period of data coverage and improve the quality of long-term reanalysis. The project involves a sophisticated data assimilation system (based on the operational set-up as of December 2018) incorporating development results from the operational NWP system and sea surface temperature analysis achieved since JRA-55 (based on the operational set-up as of December 2009). New datasets of past observations are also assimilated, including rescued historical observations and reprocessed satellite data supplied by meteorological and satellite centers worldwide. Many of the deficiencies of JRA-55 are alleviated in JRA-3Q, providing a high-quality homogeneous reanalysis dataset that covers the previous 75 years.

## DownLoad_JRA3Q_anl125_Pressure_Level.sh
- download JRA-3Q 1.25 degree isobaric analysis fields (anl_p125)

Below is the list of variable codes used in the script `DownLoad_JRA3Q_anl125_Pressure_Level.sh`, along with their respective variable names


| Variable Code in Script          | Variable Name               | Description(units)                                            |
|-----------------------------------|-----------------------------|--------------------------------------------------------------|
| 0_0_0.tmp2m-hgt-an-LL125         | 2m temperature              | Temperature at 2 meters above the ground (K)               |
| 0_0_2.pot-sfc-an-L1125          | Potential temperature       | Potential temperature at the surface (K)                    |
| 0_0_7.depr2m-hgt-an-L1125       | Dewpoint depression         | Dewpoint depression at 2 meters (K)                         |
| 0_194_6.snleng-sfc-an-L1125     | Snow depth                  | Snow depth at the surface (unit not specified)              |
| 0_194_7.snlh20-sfc-an-L1125     | Snow water equivalent       | Snow water equivalent at the surface (unit not specified)    |
| 0_1_0.spfh2m-hgt-an-L1125       | Specific humidity           | Specific humidity at 2 meters (kg kg^-1)                   |
| 0_1_1.rh2m-hgt-an-L1125         | Relative humidity          | Relative humidity at 2 meters (%)                           |
| 0_1_13.weasd-sfc-an-L1125       | Precipitable water          | Precipitable water at the surface (unit not specified)      |
| 0_1_64.tciwv-col-an-11125       | Total column integrated water vapor | Total column integrated water vapor (unit not specified) |
| 0_3_0.pres-sfc-an-L1125         | Surface pressure            | Surface pressure (unit not specified)                       |
| 0_2_3.vgrd10m-hgt-an-L1125      | Vertical wind gradient      | Vertical gradient of wind at 10 meters (m s^-1)            |
| 0_2_2.ugrd10m-hgt-an-L1125      | U-component of wind         | U-component of wind at 10 meters (m s^-1)                  |
| 0_3_1.prmsl-msl-an-L1125        | Mean sea level pressure    | Mean sea level pressure (hPa)                               |


**Note:** The saturated vapor pressure used to calculate dewpoint depression (or deficit) and relative humidity from specific humidity is determined by the temperature.
## DownLoad_JRA3Q_anl_surf125.sh
- download JRA-3Q 1.25 degree surface analysis fields (anl_surf125)
  
Below is the list of variable codes used in the script `DownLoad_JRA3Q_anl_surf125.sh`, along with their respective variable names and descriptions based on the provided images and the official JRA-3Q documentation.

| Variable Code in Script          | Variable Name               | Description(units)                                         |
|-----------------------------------|-----------------------------|--------------------------------------------------------------|
| 0_0_0.tmp2m-hgt-an-LL125`      | 2m temperature              | Temperature at 2 meters above the ground (K)              |
| 0_0_2.pot-sfc-an-Ll125        | Potential temperature       | Potential temperature at the surface (K)                   |
| 0_0_7.depr2m-hgt-an-Ll125     | Dewpoint depression         | Dewpoint depression at 2 meters (K)                        |
| 0_194_6.snleng-sfc-an-Ll125   | Snow depth                  | Snow depth at the surface (m)                              |
| 0_194_7.snlh2o-sfc-an-Ll125   | Snow water equivalent       | Snow water equivalent at the surface (kg m^-2)             |
| 0_1_0.spfh2m-hgt-an-Ll125     | Specific humidity           | Specific humidity at 2 meters (kg kg^-1)                   |
| 0_1_1.rh2m-hgt-an-Ll125       | Relative humidity          | Relative humidity at 2 meters (%)                          |
| 0_1_13.weasd-sfc-an-Ll125     | Precipitable water          | Precipitable water at the surface (kg m^-2)                |
| 0_1_64.tciwv-col-an-Ll125     | Total column integrated water vapor | Total column integrated water vapor (kg m^-2)           |
| 0_3_0.pres-sfc-an-Ll125       | Surface pressure            | Surface pressure (Pa)                                      |
| 0_2_3.vgrd10m-hgt-an-LL125    | Vertical wind gradient      | Vertical gradient of wind at 10 meters (m s^-1)            |
| 0_2_2.ugrd10m-hgt-an-LL125    | U-component of wind         | U-component of wind at 10 meters (m s^-1)                   |
| 0_3_1.prmsl-msl-an-Ll125      | Mean sea level pressure    | Mean sea level pressure (hPa)                               |

## DownLoad_JRA3Q_fcst_phyp125.sh
- download JRA-3Q 1.25 degree isobaric average diagnostic fields (fcst_phyp125)

Below is the list of variable codes used in the script `DownLoad_JRA3Q_fcst_phyp125.sh`, along with their respective variable names and descriptions based on the provided images and the official JRA-3Q documentation.
| Variable Code in Script              | Variable Name                         | Description(units)                                        |
|--------------------------------------|---------------------------------------|------------------------------------------------------------|
| 0_0_22.ttswr6have-pres-fc-Ll125   | Temperature tendency by short-wave    | Temperature tendency due to short-wave radiation (K s^-1)  |
| 0_0_23.ttlwr6have-pres-fc-Ll125   | Temperature tendency by long-wave     | Temperature tendency due to long-wave radiation (K s^-1)   |
| 0_194_1.adhr6have-pres-fc-LL125   | Adiabatic heating rate                | Adiabatic heating rate (K s^-1)                           |
| 0_194_12.admr6have-pres-fc-LL125  | Adiabatic moistening rate            | Adiabatic moistening rate (kg kg^-1 s^-1)                |
| 0_194_13.Lrgmr6have-pres-fc-Ll125 | Large scale moistening rate          | Large scale moistening rate (kg kg^-1 s^-1)               |
| 0_194_14.cnvmr6have-pres-fc-ll125 | Convective moistening rate           | Convective moistening rate (kg kg^-1 s^-1)               |
| 0_194_15.vdfmr6have-pres-fc-LL125 | Vertical diffusion moistening rate   | Vertical diffusion moistening rate (kg kg^-1 s^-1)        |
| 0_194_18.adua6have-pres-fc-Ll125  | Adiabatic zonal acceleration         | Adiabatic zonal acceleration (m s^-2)                    |
| 0_194_19.adva6have-pres-fc-Ll125  | Adiabatic meridional acceleration    | Adiabatic meridional acceleration (m s^-2)               |
| 0_194_2.Lrghr6have-pres-fc-Ll125  | Large scale condensation heating rate | Large scale condensation heating rate (K s^-1)          |
| 0_194_20.cnvua6have-pres-fc-Ll125 | Convective zonal acceleration        | Convective zonal acceleration (m s^-2)                   |
| 0_194_21.cnvva6have-pres-fc-Ll125 | Convective meridional acceleration   | Convective meridional acceleration (m s^-2)              |
| 0_194_22.vdfua6have-pres-fc-Ll125 | Vertical diffusion zonal acceleration| Vertical diffusion zonal acceleration (m s^-2)         |
| 0_194_23.vdfva6have-pres-fc-LL125 | Vertical diffusion meridional acceleration | Vertical diffusion meridional acceleration (m s^-2)    |
| 0_194_24.gwdoua6have-pres-fc-LL125| Orographic gravity wave zonal acceleration | Orographic gravity wave zonal acceleration (m s^-2)  |
| 0_194_25.gwdova6have-pres-fc-LL125| Orographic gravity wave meridional acceleration | Orographic gravity wave meridional acceleration (m s^-2) |
| 0_194_26.gwdnua6have-pres-fc-LL125| Non-orographic gravity wave zonal acceleration | Non-orographic gravity wave zonal acceleration (m s^-2)|
| 0_194_27.gwdnva6have-pres-fc-Ll125| Non-orographic gravity wave meridional acceleration | Non-orographic gravity wave meridional acceleration (m s^-2) |
| 0_3_27.umfLx6have-pres-fc-LL125  | Updraught mass flux                   | Updraught mass flux (kg m^-2 s^-1)                       |

## DownLoad_JRA3Q_fcst_phy2m125.sh
- download JRA-3Q 1.25 degree two-dimensional average diagnostic fields (fcst_phy2m125)
  
Below is the list of variable codes used in the script `DownLoad_JRA3Q_fcst_phy2m125.sh`, along with their respective variable names and descriptions based on the provided images and the official JRA-3Q documentation.

## Data Resolution
- grid:1.25° x 1.25° from 0E to 358.75E and 90N to 90S (288 x 145 Longitude/Latitude)
- time:3 hour
- level(p125): 45(0.01 to 1000 hPa) isobaric analysis fields
- level(surf125): 1 (Ground or water surface) or (Nominal top of the atmosphere)

## Notice
- The downloaded data covers the period from 1948 to 2023. To obtain data for the months of September to December in 1947 or from January 2024 to the present, you will need to modify the year loop in the shell (.sh) scripts accordingly.

## Contact Information
- If you encounter any issues or bugs while downloading the data, please do not hesitate to contact me for assistance. My email address is: **suqianye2000@gmail.com**
