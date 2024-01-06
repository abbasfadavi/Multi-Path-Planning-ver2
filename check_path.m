function [e1,e2,e3]=check_path(forbid,point)
point =squeeze(point);
pa=point2path(point);
px=pa(1,:);
py=pa(2,:);
pz=pa(3,:);

e1=sum(sum(point<0))>0;
e2=0;
for i=1:size(forbid,1)
    f=forbid(i,:);
    k1=(px>=f(1)) & (px<=f(1)+f(3));
    k2=(py>=f(2)) & (py<=f(2)+f(4));
    k3=pz<=f(5);
    k=k1&k2&k3;
    e2=e2+sum(k);
end

e3=length(px);







