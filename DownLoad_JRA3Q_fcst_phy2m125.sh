#!/bin/bash

opts="-N"
cert_opt="--no-check-certificate"

# Loop through the years 1948 to 1978
for year in {1948..2023}
do
    # Loop through each month
    for month in {01..12}
    do
        # Construct the month_year string used in the base URL
        month_year="${year}${month}"
        base_url="https://data.rda.ucar.edu/ds640.0/fcst_phy2m125/${month_year}"
        
        # Define all variable codes and their respective GRIB variable names
        variables=(
            "0_0_10.lhtfl1have-sfc-fc-ll125" "0_0_11.shtfl1have-sfc-fc-ll125" \
            "0_194_28.fgsu1have-sfc-fc-ll125" "0_194_29.fgsv1have-sfc-fc-ll125" \
            "0_194_30.fglu1have-sfc-fc-ll125" "0_194_31.fglv1have-sfc-fc-ll125" \
            "0_194_8.tuwv1have-col-fc-ll125" "0_194_9.tvwv1have-col-fc-ll125" \
            "0_1_37.cprat1have-sfc-fc-ll125" "0_1_52.tprate1have-sfc-fc-ll125" \
            "0_1_53.tsrwe1have-sfc-fc-ll125" "0_1_54.lsprate1have-sfc-fc-ll125" \
            "0_1_79.evarate1have-sfc-fc-ll125" "0_2_17.uflx1have-sfc-fc-ll125" \
            "0_2_18.vflx1have-sfc-fc-ll125" "0_3_0.pres1have-sfc-fc-ll125" \
            "0_4_52.dswrfcs1have-sfc-fc-ll125" "0_4_53.uswrfcs1have-sfc-fc-ll125" \
            "0_4_53.uswrfcs1have-toa-fc-ll125" "0_4_7.dswrf1have-sfc-fc-ll125" \
            "0_4_7.dswrf1have-toa-fc-ll125" "0_4_8.uswrf1have-sfc-fc-ll125" \
            "0_4_8.uswrf1have-toa-fc-ll125" "0_5_3.dlwrf1have-sfc-fc-ll125" \
            "0_5_4.ulwrf1have-sfc-fc-ll125" "0_5_4.ulwrf1have-toa-fc-ll125" \
            "0_5_6.nlwrcs1have-toa-fc-ll125" "0_5_8.dlwrfcs1have-sfc-fc-ll125"
        )

        # Determine the end day of the month to handle February and leap years
        if [ "$month" == "02" ]; then
            if ((year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))); then
                end_day="29" # Leap year February
            else
                end_day="28" # Non-leap year February
            fi
        elif [[ "$month" == "04" || "$month" == "06" || "$month" == "09" || "$month" == "11" ]]; then
            end_day="30"
        else
            end_day="31"
        fi

        # Loop through each variable code
        for var in "${variables[@]}"
        do
            file_name="jra3q.fcst_phy2m125.${var}.${month_year}0100_${month_year}${end_day}23.nc"
            
            # Check if the file already exists and is not empty
            if [ -f "$file_name" ] && [ -s "$file_name" ]; then
                echo "File $file_name already exists and is not empty. Skipping download."
            else
                echo "Downloading $file_name from $base_url..."
                # Download the file
                wget $cert_opt $opts "${base_url}/${file_name}"
            fi
        done
    done
done
