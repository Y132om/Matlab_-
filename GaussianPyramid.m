img1=imread('lena.png');%����ͼƬ
[m,n]=size(img1);
%{
h = fspecial(type) 
h = fspecial(type��para) 
���ݺ���ԭ�Ͷ�fspecial��������˵����
fspecial�����������˲�����Ҳ�����ӣ��ĺ�����
ʹ��type������ָ���˲��������࣬
ʹ��para���Ծ�����˲���������Ӷ���Ĳ�����Ϣ��h�������ɵ��˲�����
type����ͨ������ȡgaussian��average��disk��laplacian��log��prewitt
%}
w=fspecial('gaussian',[3,3])
img2=imresize(imfilter(img1,w),[m/2 n/2]);
img3=imresize(imfilter(img2,w),[m/4 n/4]);
img4=imresize(imfilter(img3,w),[m/8 n/8]);
img5=imresize(imfilter(img4,w),[m/16 n/16]);
imshow(img1);
figure,imshow(img2);
figure,imshow(img3);
figure,imshow(img4);
figure,imshow(img5);



