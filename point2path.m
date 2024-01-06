function path=point2path(point)
px=[];
py=[];
pz=[];
for i=1:size(point,2)-2+1
    d=round(sqrt(sum((point(:,i)-point(:,i+1)).^2)));
    px=[px linspace(point(1,i),point(1,i+1),d)];
    py=[py linspace(point(2,i),point(2,i+1),d)];
    pz=[pz linspace(point(3,i),point(3,i+1),d)];
end
rep=find(diff(px)==0 & diff(py)==0 & diff(pz)==0);
px(rep)=[];
py(rep)=[];
pz(rep)=[];
path=[px;py;pz];



