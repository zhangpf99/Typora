# listview控件设置

- HeaderColor: $00FBF2E8

- FrameHotTrack：false

- FrameStyle：fsnone

- FrameVisible：true

- OwnerDraw：true

如果出现listview的首行（列头）显示不全问题：

1.下图这种情况，尝试修改listview的字体格式：设置为宋体，9号，如果原本即为宋体，9号字但显示仍有问题，尝试修改字符集，如原来是西欧语言，改为GB2312尝试，原来是GB2312，则改为西欧语言尝试，基本问题都可解决。

![image-20210224144822750](picture/image-20210224144822750.png)

2.控件可勾选

如果想设置为可勾选，则设置为：**checkboxes属性为：True，同时设置OwnerDraw：false**

![image-20210517112914596](picture/image-20210517112914596.png)

![image-20210517112848087](picture/image-20210517112848087.png)

## ondata事件

delphi中listview中的ondata事件

> 参考“大宗交易确认委托”界面的stbConfirm.pas中listview中的ondata事件
>
> 使用方式：
>
> 首先将listview属性OwnerData设为True
> 然后在listview.ondata事件里利用Item: TListItem参数进行修改
> 如 
>  item.Caption:='Caption'+inttostr(item.index);
>  item.SubItems.Add('subItems1'+inttostr(item.index));
>  item.SubItems.Add('subItems2'+inttostr(item.index));
> 最后在其他事件中要显示listview数据时，将
> ListView1.Items.Count:=100;即可

3. ### SortType 属性:默认一般都是0

> 此属性用于设置什么情况下列表视图中的项将重新排列。它设定了如下4 个用户可选值。 
>  stNone：不重新排序。
>  stData：项的Data 属性发生变化时重新排序。
>  stText：项的Caption 属性发生变化时重新排序。
>  stBoth：项的Data 属性或Caption 属性发生变化时重新排序。
> ————————————————
> 版权声明：本文为CSDN博主「_毛毛_」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
> 原文链接：https://blog.csdn.net/yt_maomao/article/details/37725489