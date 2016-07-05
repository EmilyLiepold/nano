



pro ligand_length_distribution,data

fls = file_search('T*')
chain_length = 12
nligands = 471
nframes = 100
outs = [0.,0.,0.,0.,]
startpos = (chain_length - 1) * nligands
print,startpos
ligands = indgen(nligands,start=startpos)
l_low = min(ligands)
l_high = max(ligands)

help,ligands
for i= 0,n_elements(fls)-1 do begin
  r = read_gdf(fls[i])
  w = where((r[4,*] ge l_low) && (r[4,*] le l_high))
  r2 = 
;  for j = 0,n_elements(r[0,*])-1 do begin
;    if (r[2,j] ge l_low) && (r[2,j] le l_high) then begin
;      
;    endif
;    
;  endfor
  
endfor


read_xyz



end