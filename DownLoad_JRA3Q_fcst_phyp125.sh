#!/bin/bash

opts="-N"
cert_opt="--no-check-certificate"
# If you get a certificate verification error, uncomment the following line:
# cert_opt="--no-check-certificate"

# Loop through the years and months
for year in {1970..1978}; do
    for month in {01..12}; do
        # Construct the month_year string used in the base URL
        month_year="${year}${month}"
        base_url="https://data.rda.ucar.edu/ds640.0/fcst_phyp125/${month_year}"

        # Define all variable codes and their respective GRIB variable names
        variables=(
            "0_0_22.ttswr6have-pres-fc-ll125" "0_0_23.ttlwr6have-pres-fc-ll125"
            # "0_194_1.adhr6have-pres-fc-ll125" "0_194_12.admr6have-pres-fc-ll125"
            # "0_194_13.lrgmr6have-pres-fc-ll125" "0_194_14.cnvmr6have-pres-fc-ll125"
            # "0_194_15.vdfmr6have-pres-fc-ll125" "0_194_18.adua6have-pres-fc-ll125"
            # "0_194_19.adva6have-pres-fc-ll125" "0_194_2.lrghr6have-pres-fc-ll125"
            # "0_194_20.cnvua6have-pres-fc-ll125" "0_194_21.cnvva6have-pres-fc-ll125"
            # "0_194_22.vdfua6have-pres-fc-ll125" "0_194_23.vdfva6have-pres-fc-ll125"
            # "0_194_24.gwdoua6have-pres-fc-ll125" "0_194_25.gwdova6have-pres-fc-ll125"
            # "0_194_26.gwdnua6have-pres-fc-ll125" "0_194_27.gwdnva6have-pres-fc-ll125"
            # "0_194_3.cnvhr6have-pres-fc-ll125" "0_194_4.vdfhr6have-pres-fc-ll125"
            # "0_3_27.umflx6have-pres-fc-ll125"
        )

        # Determine the last day of the month to handle February and leap years
        if [ "$month" == "02" ]; then
            if ((year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))); then
                last_day="29"
            else
                last_day="28"
            fi
        elif [[ "$month" == "04" || "$month" == "06" || "$month" == "09" || "$month" == "11" ]]; then
            last_day="30"
        else
            last_day="31"
        fi

        # Define time segments for each month based on the last day
        first_segment_start="${year}${month}0100"
        first_segment_end="${year}${month}1518"
        second_segment_start="${year}${month}1600"
        second_segment_end="${year}${month}${last_day}18"

        # Loop through each variable code
        for var in "${variables[@]}"; do
            # Construct file names for both segments
            first_file_name="jra3q.fcst_phyp125.${var}.${first_segment_start}_${first_segment_end}.nc"
            second_file_name="jra3q.fcst_phyp125.${var}.${second_segment_start}_${second_segment_end}.nc"

            # Download first segment
            if [ ! -f "$first_file_name" ]; then
                echo "Downloading $first_file_name..."
                wget $cert_opt $opts "$base_url/$first_file_name"
            else
                echo "File $first_file_name already exists. Skipping download."
            fi

            # Download second segment
            if [ ! -f "$second_file_name" ]; then
                echo "Downloading $second_file_name..."
                wget $cert_opt $opts "$base_url/$second_file_name"
            else
                echo "File $second_file_name already exists. Skipping download."
            fi
        done
    done
done

