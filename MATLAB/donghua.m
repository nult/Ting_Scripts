num=19;
for i=1:num
    str = strcat(num2str(i), '.jpg');
    A=imread(str);
    [I,map]=rgb2ind(A,256);
    if(i==1)
        imwrite(I,map,'movefig.gif','DelayTime',0.1,'LoopCount',Inf)
    else
        imwrite(I,map,'movefig.gif','WriteMode','append','DelayTime',0.3)    
    end
end

%��ʱ�轫�����������е�append��ΪoverwriteȻ�����к��ٸĻ�append���Ϳ�������һ��GIF�����ˡ�

