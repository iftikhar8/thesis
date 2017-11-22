cp ../bran3p5_data/u/ocean_u_2004_04.nc ../bran3p5_data/u/ocean_u_2004_05.nc  ../bran3p5_data/u/ocean_u_2004_06.nc ../bran3p5_data/u/ocean_u_2004_07.nc ../bran3p5_data/u/ocean_u_2004_08.nc 2004/u/.

cp ../bran3p5_data/v/ocean_v_2004_04.nc ../bran3p5_data/v/ocean_v_2004_05.nc  ../bran3p5_data/v/ocean_v_2004_06.nc ../bran3p5_data/v/ocean_v_2004_07.nc ../bran3p5_data/v/ocean_v_2004_08.nc 2004/v/.

cp ../bran3p5_data/w/ocean_w_2004_04.nc ../bran3p5_data/w/ocean_w_2004_05.nc  ../bran3p5_data/w/ocean_w_2004_06.nc ../bran3p5_data/w/ocean_w_2004_07.nc ../bran3p5_data/w/ocean_w_2004_08.nc 2004/w/.


rsync -avx shaw7955@rcos-int.sydney.edu.au:/rds/PRJ-ichthyconnect/netcdf/blackcod/2010 /srv/zissou/input/netcdf/bran/.
