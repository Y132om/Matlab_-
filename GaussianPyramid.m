img1=imread('lena.png');%读入图片
[m,n]=size(img1);
%{
h = fspecial(type) 
h = fspecial(type，para) 
根据函数原型对fspecial函数作个说明，
fspecial是用来生成滤波器（也叫算子）的函数，
使用type参数来指定滤波器的种类，
使用para来对具体的滤波器种类添加额外的参数信息。h就是生成的滤波器。
type参数通常可以取gaussian、average、disk、laplacian、log、prewitt
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



