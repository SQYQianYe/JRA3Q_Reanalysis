import os
import re
import shutil
import xarray as xr
import cfgrib

class FileManager:
    def __init__(self, folder_path):
        self.folder_path = folder_path

    def rename_files(self, old_extension, new_extension):
        for file in os.listdir(self.folder_path):
            if file.endswith(old_extension):
                file_name_without_ext = os.path.splitext(file)[0]
                new_file_name = f"{file_name_without_ext}{new_extension}"
                old_file_path = os.path.join(self.folder_path, file)
                new_file_path = os.path.join(self.folder_path, new_file_name)
                os.rename(old_file_path, new_file_path)
                print(f"Renamed {old_file_path} to {new_file_path}")
                
    def add_extension(self, extension):
        for file in os.listdir(self.folder_path):
            file_path = os.path.join(self.folder_path, file)
            if not file.endswith(extension) and os.path.isfile(file_path):
                new_file_name = f"{file}{extension}"
                new_file_path = os.path.join(self.folder_path, new_file_name)
                os.rename(file_path, new_file_path)
                print(f"Added extension to {file_path}, new file name: {new_file_path}")


    def Convert_Grd_to_Netcdf_process_files(self):
        for file_name in os.listdir(self.folder_path):
            file_path = os.path.join(self.folder_path, file_name)
    
            if not os.path.isfile(file_path):
                continue
    
            # get variable
            variable_name = re.search(r'\.(\d{2,4})_(\w+)\.', file_name).group(2)
    
            # read GRIB1 convert tp NetCDF
            try:
                data = xr.open_dataset(file_path, engine="cfgrib")
            except cfgrib.DatasetBuildError as e:
                filter_options = re.findall(r"filter_by_keys=\{(.*?)\}", str(e))
                if filter_options:
                    for filter_option in filter_options:
                        filter_key, filter_value = filter_option.split(': ')
                        filter_value = filter_value.strip("'")
                        try:
                            data = xr.open_dataset(file_path, engine="cfgrib", filter_by_keys={filter_key: filter_value})
                            break
                        except Exception as e:
                            print(f"error {e}")
                            print(f"Failed to open {file_path} with '{filter_value}' {filter_key}, trying next option")
                    else:
                        print(f"Failed to open {file_path} with all suggested options, skipping file")
                        continue
                else:
                    print(f"Failed to open {file_path}, skipping file")
                    continue
            except Exception as e:
                print(f"Failed to open {file_path} with unknown error, skipping file")
                print(f"error {e}")
                continue
            
            data.close()  # close data
            #  NetCDF 
            output_file_name = file_name.replace(".grd", ".nc")
            output_file_path = os.path.join(self.folder_path, output_file_name)
            print(output_file_path)
            data.to_netcdf(output_file_path, mode='w')
    
            # move data
            variable_folder = os.path.join(self.folder_path, variable_name)
            if not os.path.exists(variable_folder):
                os.makedirs(variable_folder)
            shutil.move(output_file_path, os.path.join(variable_folder, output_file_name))


if __name__ == "__main__":
    folder_path = r"single level"
    file_manager = FileManager(folder_path)
    file_manager.add_extension(".grd")
    file_manager.Convert_Grd_to_Netcdf_process_files()
    

