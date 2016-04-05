library(raster)
r = raster("C:\\Data\\rainfall.tif")
r[120, 120] = 1000
writeRaster(r, "C:\\Data\\rainfall2.tif")