function my_addmesh(scene,x,y,lx,ly,h)
addMesh(scene,"Polygon", {[x y; x+lx y; x+lx y+ly; x y+ly], [0 h]}, [0.5 1 0.3]);
