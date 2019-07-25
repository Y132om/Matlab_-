clear all; 
close all;
clc;

%%��һ�������ݺͱ��
mu1=[0 0];  %��ֵ
S1=[0.3 0;0 0.35];  %Э����
data1=mvnrnd(mu1,S1,100);   %������˹�ֲ�����
plot(data1(:,1),data1(:,2),'+');
label1=ones(100,1);
hold on;

%%�ڶ��������ݺͱ��
mu2=[1.25 1.25];
S2=[0.3 0;0 0.35];
data2=mvnrnd(mu2,S2,100);
plot(data2(:,1),data2(:,2),'ro');
label2=label1+1;

data=[data1;data2];
label=[label1;label2];

K=11;   %�����࣬Kȡ�������ܹ����ֲ������������Ǹ���
%�������ݣ�KNN�㷨������������ĸ���
for ii=-3:0.1:3
    for jj=-3:0.1:3
        test_data=[ii jj];  %��������
        label=[label1;label2];
        %%���濪ʼKNN�㷨����Ȼ������11NN��
        %��������ݺ�����ÿ�����ݵľ��룬ŷʽ���루�����Ͼ��룩 
        distance=zeros(200,1);
        for i=1:200
            distance(i)=sqrt((test_data(1)-data(i,1)).^2+(test_data(2)-data(i,2)).^2);
        end

        %ѡ�����򷨣�ֻ�ҳ���С��ǰK������,�����ݺͱ�Ŷ���������
        for i=1:K
            ma=distance(i);
            for j=i+1:200
                if distance(j)<ma
                    ma=distance(j);
                    label_ma=label(j);
                    tmp=j;
                end
            end
            distance(tmp)=distance(i);  %������
            distance(i)=ma;

            label(tmp)=label(i);        %�ű�ţ���Ҫʹ�ñ��
            label(i)=label_ma;
        end

        cls1=0; %ͳ����1�о��������������ĸ���
        for i=1:K
           if label(i)==1 
               cls1=cls1+1;
           end
        end
        cls2=K-cls1;    %��2�о��������������ĸ���
        
        if cls1>cls2    
           plot(ii,jj,'g.');     %������1�����ݻ�С�ڵ�
        end
        
    end
end