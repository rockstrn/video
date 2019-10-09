%С���任f�Ӻ���
function y = f(x1 , x2)

%�������ܣ�
%       y=f(x1,x2)������ԭͼ��x1��x2������������������ںϹ�������ں�,�õ��ںϺ��ͼ��y
%       ���ȼ�������ͼ���ƥ��ȣ���ƥ��ȴ�����ֵ��˵������ͼ���Ӧ�ֲ������Ͻӽ���
%       ��˲��ü�Ȩƽ�����ںϷ�������ƥ���С����ֵ��˵������ͼ���Ӧ�ֲ��������ϴ�
%       ���ѡȡ�ֲ����������ϴ��С��ϵ����Ϊ�ں�ͼ���С��ϵ��
%���������
%      x1----����ԭͼ��1
%      x2----����ԭͼ��2
%���������
%      y----�ںϺ��ͼ��
%------------------------------------------------------------%

w=1/16*[1 2 1;2 4 2;1 2 1];   %Ȩϵ��
E1=conv2(x1.^2,w,'same');     %�ֱ��������ͼ����Ӧ�ֽ���϶�Ӧ�ֲ�����ġ�������
E2=conv2(x2.^2,w,'same');
M=2*conv2(x1.*x2,w,'same')./(E1+E2);%��������ͼ���Ӧ�ֲ������ƥ���
T=0.7;                              %����ƥ����ֵ
Wmin=1/2-1/2*((1-M)/(1-T));
Wmax=1-Wmin;
[m,n]=size(M);

for i=1:m
    for j=1:n
        if M(i,j)<T                %���ƥ���С��ƥ����ֵ��˵������ͼ���Ӧ�ֲ��������������Զ��
            if E1(i,j)>=E2(i,j)    %��ô��ֱ��ѡȡ���������ϴ��С��ϵ��
                y(i,j)=x1(i,j);
            else
                y(i,j)=x2(i,j);
            end
        else                       %���ƥ��ȴ���ƥ����ֵ��˵������ͼ���Ӧ�ֲ����������ȽϽӽ���
            if E1(i,j)>=E2(i,j)    %��ô�Ͳ��ü�Ȩ���ں��㷨
                y(i,j)=Wmax(i,j)*x1(i,j)+Wmin(i,j)*x2(i,j);
            else
                y(i,j)=Wmin(i,j)*x1(i,j)+Wmax(i,j)*x2(i,j);
            end
        end
    end
end