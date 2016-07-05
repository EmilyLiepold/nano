pro read_tr

;dir = '/Users/sphere4/Desktop/Molly Chris 2015/Closed Cavity Runs/xyzs_dump_higher_res/Dumps/Test_D20/'
dir = '/Users/sphere4/Desktop/Chris Nanoparticles/dumps/Outs/'
cd,dir

fls = file_search('D*')
numdump = n_elements(fls)

for dmp = 0, numdump -1 do begin
  xyz = dir + fls[dmp]
  n = (rascii(xyz,num_records=1))[0]
;  n = (fix(n.field1))[0]
  g = read_xyz_2d3d(xyz)

  length = n_elements(g[0,*])

  nframes = max(g[5,*])+1

  out = fltarr(5,length)
  out[0:2,*] = g[0:2,*]
  out[3,*] = g[5,*]

  l = indgen(nframes, /long)

  for i=0,n-1 do begin

    r = l * 0.
    r = (l)* n + i

;    if i eq 100 then print,r


    out[4,r] = i

  endfor

  write_gdf,out,'T'+string(dmp+1,Format='(I3.3)')
  
  
  
endfor




end


