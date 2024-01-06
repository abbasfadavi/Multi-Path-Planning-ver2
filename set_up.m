function forbid=set_up
hold on
scene = uavScenario("UpdateRate",100,"StopTime",1);  
addMesh(scene,"Polygon", {[1 1; 100 1; 100 100; 1 100], [-2 0]}, [0.3 0.3 0.3]);
forbid=[60,20,20,20,20;
        20,20,20,10,60;
        50,50,10,20,20;
        10,10,50,20,30;
        30,70,40,20,30;
         1,60,10,20,20];
my_addmesh(scene,forbid(1,1),forbid(1,2),forbid(1,3),forbid(1,4),forbid(1,5))
my_addmesh(scene,forbid(2,1),forbid(2,2),forbid(2,3),forbid(2,4),forbid(2,5))
my_addmesh(scene,forbid(3,1),forbid(3,2),forbid(3,3),forbid(3,4),forbid(3,5))
my_addmesh(scene,forbid(4,1),forbid(4,2),forbid(4,3),forbid(4,4),forbid(4,5))
my_addmesh(scene,forbid(5,1),forbid(5,2),forbid(5,3),forbid(5,4),forbid(5,5))
my_addmesh(scene,forbid(6,1),forbid(6,2),forbid(6,3),forbid(6,4),forbid(6,5))
show3D(scene);




