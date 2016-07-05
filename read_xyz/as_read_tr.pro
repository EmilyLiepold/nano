pro as_read_tr, dir = dir, pN = pN
;need to put the backslash after the directory name
if keyword_set(dir) then dir = dir else dir =  '/Volumes/ALEX SMITH/1.4 Size Ratio/';/Users/sphere2/Desktop/June28/Best/all_spheres/';';/Users/sphere4/Desktop/Alex Smith 2015/'
;the particle number to find (if it is -1 then it finds all of the partcicles)
if keyword_set(pN) then numPart = pN else numPart = -1
cd,dir

;todo - give this command line options

fls = file_search('D*')
print, fls
numdump = n_elements(fls)
cd, dir
for dmp = 0, numdump -1 do begin
  print, dir
  print, fls[dmp]
  xyz = dir + fls[dmp]
  n = (rascii(xyz,num_records=1))[0]
;  not sure why this was here and commented (Chris had this) n = (fix(n.field1))[0]
  if numPart eq -1 then g = as_read_xyz(xyz) else g = as_read_xyz(xyz, numPart)
  length = n_elements(g[0,*])

  nframes = max(g[5,*])+1

  out = fltarr(4,length)
  out[0:1,*] = g[0:1,*]
  out[2,*] = g[5,*]

  l = indgen(nframes, /long)

  for i=0,n-1 do begin

    r = l * 0.
    r = (l)* n + i

;not sure why this was here and commented (Chris had this)    if i eq 100 then print,r


    out[3,r] = i

  endfor
  ;use this so it's easier to keep things together
  outFile = 'T' + strmid(fls[dmp],0,strlen(fls[dmp]) - 4)
  
  ; the old one, what Chris had when I first started using the program write_gdf,out,'T'+string(dmp+1,Format='(I3.3)')
  write_gdf, out, outfile
  
  
  
endfor




end


