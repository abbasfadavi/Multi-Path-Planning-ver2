function e=check_paths(n,point)
for i=1:n
    p{i}=point2path(squeeze(point(i,:,:)));
    size_mat(i)=size(p{i},2);
end
%%
min_size=min(size_mat);
for i=1:n
    pp=p{i};
    mat(i,:,:)=pp(:,1:min_size);
end
%%
for i=1:n
    pi=squeeze(mat(i,:,:));
    for j=1:n
        pj=squeeze(mat(j,:,:));
        e(i,j)=min(sqrt((pi(1,:)-pj(1,:)).^2+(pi(2,:)-pj(2,:)).^2+(pi(3,:)-pj(3,:)).^2));
    end
end
e=min(min(e))>=5;% minimum length two paths











