FasdUAS 1.101.10   ��   ��    k             l     ��������  ��  ��        l     �� 	 
��   	  	Created by: MyName    
 �   & 	 C r e a t e d   b y :   M y N a m e      l     ��  ��     	Created on: 7/9/19     �   & 	 C r e a t e d   o n :   7 / 9 / 1 9      l     ��������  ��  ��        l     ��  ��    : 4	Copyright � 2019 MyCompanyName, All Rights Reserved     �   h 	 C o p y r i g h t   �   2 0 1 9   M y C o m p a n y N a m e ,   A l l   R i g h t s   R e s e r v e d      l     ��������  ��  ��        l     ��������  ��  ��        l           x     �� ! "��   ! 1      ��
�� 
ascr " �� #��
�� 
minv # m       $ $ � % %  2 . 4��       Yosemite (10.10) or later      � & & 4   Y o s e m i t e   ( 1 0 . 1 0 )   o r   l a t e r   ' ( ' x    �� )����   ) 2  	 ��
�� 
osax��   (  * + * l     ��������  ��  ��   +  , - , l   ^ .���� . O    ^ / 0 / k   ] 1 1  2 3 2 l   ��������  ��  ��   3  4 5 4 r    
 6 7 6 l    8���� 8 e     9 9 1    ��
�� 
csev��  ��   7 o      ���� $0 selectedvariants selectedVariants 5  : ; : l   ��������  ��  ��   ;  < = < Z     > ?���� > =    @ A @ o    ���� $0 selectedvariants selectedVariants A J    ����   ? k     B B  C D C I   �� E��
�� .sysodlogaskr        TEXT E m     F F � G G Z N o   i m a g e s   s e l e c t e d   -   s e l e c t   i m a g e s   a n d   r e - r u n��   D  H�� H l   �� I J��   I    THEN MAKE THE PROGRAM END    J � K K 4   T H E N   M A K E   T H E   P R O G R A M   E N D��  ��  ��   =  L M L l   ��������  ��  ��   M  N�� N O   ] O P O k   $\ Q Q  R S R l  $ $��������  ��  ��   S  T U T r   $ / V W V l  $ - X���� X b   $ - Y Z Y l  $ ) [���� [ c   $ ) \ ] \ 1   $ '��
�� 
COdf ] m   ' (��
�� 
ctxt��  ��   Z 1   ) ,��
�� 
pnam��  ��   W o      ���� 0 sessionpath sessionPath U  ^ _ ^ l  0 0�� ` a��   `  set sessionName to name    a � b b . s e t   s e s s i o n N a m e   t o   n a m e _  c d c r   0 5 e f e l  0 3 g���� g n   0 3 h i h 1   1 3��
�� 
psxp i o   0 1���� 0 sessionpath sessionPath��  ��   f o      ���� $0 sessionposixpath sessionPosixPath d  j k j l  6 6�� l m��   l ' ! display notification sessionPath    m � n n B   d i s p l a y   n o t i f i c a t i o n   s e s s i o n P a t h k  o p o l  6 6�� q r��   q + %display notification sessionPosixPath    r � s s J d i s p l a y   n o t i f i c a t i o n   s e s s i o n P o s i x P a t h p  t u t l  6 6�� v w��   v 3 - set all recipes to false so they're not used    w � x x Z   s e t   a l l   r e c i p e s   t o   f a l s e   s o   t h e y ' r e   n o t   u s e d u  y z y l  6 6�� { |��   { 4 .repeat with counter from 1 to count of recipes    | � } } \ r e p e a t   w i t h   c o u n t e r   f r o m   1   t o   c o u n t   o f   r e c i p e s z  ~  ~ l  6 6�� � ���   � / )	set theRecipe to item counter of recipes    � � � � R 	 s e t   t h e R e c i p e   t o   i t e m   c o u n t e r   o f   r e c i p e s   � � � l  6 6�� � ���   � 0 *	set recipeName to (get name of theRecipe)    � � � � T 	 s e t   r e c i p e N a m e   t o   ( g e t   n a m e   o f   t h e R e c i p e ) �  � � � l  6 6�� � ���   � ( "	set enabled of theRecipe to false    � � � � D 	 s e t   e n a b l e d   o f   t h e R e c i p e   t o   f a l s e �  � � � l  6 6�� � ���   � 7 1	set enabledBoolean to (get enabled of theRecipe)    � � � � b 	 s e t   e n a b l e d B o o l e a n   t o   ( g e t   e n a b l e d   o f   t h e R e c i p e ) �  � � � l  6 6�� � ���   � 7 1	display dialog recipeName & " " & enabledBoolean    � � � � b 	 d i s p l a y   d i a l o g   r e c i p e N a m e   &   "   "   &   e n a b l e d B o o l e a n �  � � � l  6 6�� � ���   �  
end repeat    � � � �  e n d   r e p e a t �  � � � l  6 6��������  ��  ��   �  � � � l  6 6�� � ���   � 2 ,# set current recipe to autocrop & enable it    � � � � X #   s e t   c u r r e n t   r e c i p e   t o   a u t o c r o p   &   e n a b l e   i t �  � � � l  6 6�� � ���   � 1 +set current recipe to recipe "autocrop_jpg"    � � � � V s e t   c u r r e n t   r e c i p e   t o   r e c i p e   " a u t o c r o p _ j p g " �  � � � l  6 6�� � ���   � + %set enabled of current recipe to true    � � � � J s e t   e n a b l e d   o f   c u r r e n t   r e c i p e   t o   t r u e �  � � � l  6 6��������  ��  ��   �  � � � l  6 6�� � ���   �   I'm thinking next:    � � � � &   I ' m   t h i n k i n g   n e x t : �  � � � l  6 6�� � ���   � #  1. get all selected variants    � � � � :   1 .   g e t   a l l   s e l e c t e d   v a r i a n t s �  � � � l  6 6�� � ���   � 8 2 2. set autocrop recipe and get output information    � � � � d   2 .   s e t   a u t o c r o p   r e c i p e   a n d   g e t   o u t p u t   i n f o r m a t i o n �  � � � l  6 6��������  ��  ��   �  � � � l  6 6�� � ���   � : 4 set all recipes to False so they won't output files    � � � � h   s e t   a l l   r e c i p e s   t o   F a l s e   s o   t h e y   w o n ' t   o u t p u t   f i l e s �  � � � Y   6 \ ��� � ��� � k   F W � �  � � � r   F O � � � n   F M � � � 4   I M�� �
�� 
cobj � 1   J L��
�� 
CBcc � 2  F I��
�� 
COrp � o      ���� 0 	therecipe 	theRecipe �  ��� � r   P W � � � m   P Q��
�� boovfals � n       � � � 1   R V��
�� 
CRen � o   Q R���� 0 	therecipe 	theRecipe��  
�� 
CBcc � m   9 :����  � I  : A�� ���
�� .corecnte****       **** � 2  : =��
�� 
COrp��  ��   �  � � � l  ] ]��������  ��  ��   �  � � � r   ] d � � � m   ] ` � � � � �  a u t o c r o p _ j p g � o      ����  0 autocroprecipe autocropRecipe �  � � � r   e q � � � 4   e k�� �
�� 
COrp � o   g j����  0 autocroprecipe autocropRecipe � 1   k p��
�� 
Cure �  � � � r   r } � � � m   r s��
�� boovtrue � n       � � � 1   x |��
�� 
CRen � 1   s x��
�� 
Cure �  � � � r   ~ � � � � l  ~ � ����� � e   ~ � � � n   ~ � � � � 1   � ���
�� 
pnam � 1   ~ ���
�� 
Cure��  ��   � o      ���� 0 
recipename 
recipeName �  � � � l  � ��� � ���   � 8 2 display notification "Recipe name: " & recipeName    � � � � d   d i s p l a y   n o t i f i c a t i o n   " R e c i p e   n a m e :   "   &   r e c i p e N a m e �  � � � l  � ��� � ���   � + % https://stackoverflow.com/a/34329973    � � � � J   h t t p s : / / s t a c k o v e r f l o w . c o m / a / 3 4 3 2 9 9 7 3 �  � � � r   � � �  � l  � ����� b   � � l  � ����� c   � � n   � � 1   � ��
� 
CRrf 1   � ��~
�~ 
Cure m   � ��}
�} 
ctxt��  ��   l  � �	�|�{	 n   � �

 1   � ��z
�z 
CRsf 1   � ��y
�y 
Cure�|  �{  ��  ��    o      �x�x 0 recipe_output_folder   �  l  � ��w�w   T N set recipe_output_folder_posix_path to the POSIX path of recipe_output_folder    � �   s e t   r e c i p e _ o u t p u t _ f o l d e r _ p o s i x _ p a t h   t o   t h e   P O S I X   p a t h   o f   r e c i p e _ o u t p u t _ f o l d e r  l  � ��v�v   5 / display dialog recipe_output_folder_posix_path    � ^   d i s p l a y   d i a l o g   r e c i p e _ o u t p u t _ f o l d e r _ p o s i x _ p a t h  l  � ��u�u   0 * display notification recipe_output_folder    � T   d i s p l a y   n o t i f i c a t i o n   r e c i p e _ o u t p u t _ f o l d e r  l  � ��t�s�r�t  �s  �r    l  � ��q�p�o�q  �p  �o     Y   �Z!�n"#�m! k   �U$$ %&% l  � ��l�k�j�l  �k  �j  & '(' l  � ��i)*�i  ) 6 0 3. output selected variants with autocropRecipe   * �++ `   3 .   o u t p u t   s e l e c t e d   v a r i a n t s   w i t h   a u t o c r o p R e c i p e( ,-, l  � ��h./�h  . > 8 REALLY need to add the logic from the other script that   / �00 p   R E A L L Y   n e e d   t o   a d d   t h e   l o g i c   f r o m   t h e   o t h e r   s c r i p t   t h a t- 121 l  � ��g34�g  3 B < deletes all images with the current selected variant's name   4 �55 x   d e l e t e s   a l l   i m a g e s   w i t h   t h e   c u r r e n t   s e l e c t e d   v a r i a n t ' s   n a m e2 676 l  � ��f89�f  8 "  from the autocrop directory   9 �:: 8   f r o m   t h e   a u t o c r o p   d i r e c t o r y7 ;<; l  � ��e=>�e  = G A ** it might make more sense to get the list of selected variants   > �?? �   * *   i t   m i g h t   m a k e   m o r e   s e n s e   t o   g e t   t h e   l i s t   o f   s e l e c t e d   v a r i a n t s< @A@ l  � ��dBC�d  B B < THEN delete all files with the same name from the directory   C �DD x   T H E N   d e l e t e   a l l   f i l e s   w i t h   t h e   s a m e   n a m e   f r o m   t h e   d i r e c t o r yA EFE l  � ��cGH�c  G H B I can also see creating a token to save the image with that's 			   H �II �   I   c a n   a l s o   s e e   c r e a t i n g   a   t o k e n   t o   s a v e   t h e   i m a g e   w i t h   t h a t ' s   	 	 	F JKJ l  � ��b�a�`�b  �a  �`  K LML r   � �NON n   � �PQP 4   � ��_R
�_ 
cobjR 1   � ��^
�^ 
CBccQ o   � ��]�] $0 selectedvariants selectedVariantsO o      �\�\ 0 
thevariant 
theVariantM STS r   � �UVU n   � �WXW 1   � ��[
�[ 
pnamX o   � ��Z�Z 0 
thevariant 
theVariantV o      �Y�Y 0 	imagename 	imageNameT YZY r   � �[\[ n   � �]^] 1   � ��X
�X 
ID  ^ o   � ��W�W 0 
thevariant 
theVariant\ o      �V�V 0 variantuuid variantUUIDZ _`_ l  � ��Uab�U  a !  display dialog variantUUID   b �cc 6   d i s p l a y   d i a l o g   v a r i a n t U U I D` ded I  � ��Tf�S
�T .sysonotfnull��� ��� TEXTf b   � �ghg m   � �ii �jj  A u t o C r o p p i n g  h o   � ��R�R 0 	imagename 	imageName�S  e klk l  � ��Q�P�O�Q  �P  �O  l mnm l  � ��Nop�N  o 4 . delete any images in the recipe_output_folder   p �qq \   d e l e t e   a n y   i m a g e s   i n   t h e   r e c i p e _ o u t p u t _ f o l d e rn rsr l  � ��Mtu�M  t h b NOTE: means it will delete previous output images when processing 2 variants of the same RAW file   u �vv �   N O T E :   m e a n s   i t   w i l l   d e l e t e   p r e v i o u s   o u t p u t   i m a g e s   w h e n   p r o c e s s i n g   2   v a r i a n t s   o f   t h e   s a m e   R A W   f i l es wxw O   �yzy Z   �{|�L�K{ I  � ��J}�I
�J .coredoexnull���     obj } o   � ��H�H 0 recipe_output_folder  �I  | I  �
�G~�F
�G .coredelonull���     obj ~ l  ��E�D 6  ���� l  � ���C�B� n   � ���� 2   � ��A
�A 
cobj� 4   � ��@�
�@ 
cfol� o   � ��?�? 0 recipe_output_folder  �C  �B  � C  ���� 1   � ��>
�> 
pnam� o   �=�= 0 	imagename 	imageName�E  �D  �F  �L  �K  z m   � ����                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  x ��� l �<�;�:�<  �;  �:  � ��� r  ��� m  �� ���  0 . 0� n      ��� 1  �9
�9 
CVro� n  ��� 1  �8
�8 
vset� o  �7�7 0 
thevariant 
theVariant� ��� l   �6���6  � B < set flip_setting to (get flip of adjustments of theVariant)   � ��� x   s e t   f l i p _ s e t t i n g   t o   ( g e t   f l i p   o f   a d j u s t m e n t s   o f   t h e V a r i a n t )� ��� l   �5���5  � "  display dialog flip_setting   � ��� 8   d i s p l a y   d i a l o g   f l i p _ s e t t i n g� ��� r   /��� m   #�4
�4 CfleCfln� n      ��� 1  *.�3
�3 
CVfl� n  #*��� 1  &*�2
�2 
vset� o  #&�1�1 0 
thevariant 
theVariant� ��� l 00�0�/�.�0  �/  �.  � ��� r  0?��� I 0;�-��
�- .Cap1procnull���     ****� o  03�,�, 0 
thevariant 
theVariant� �+��*�+  0 autocroprecipe autocropRecipe� m  67�)
�) boovtrue�*  � o      �(�( 0 	theresult 	theResult� ��� l @@�'�&�%�'  �&  �%  � ��� r  @G��� m  @C�� ���  . j p g� o      �$�$ 0 output_extension  � ��� r  H]��� b  HY��� b  HU��� b  HQ��� l HM��#�"� c  HM��� o  HK�!�! 0 recipe_output_folder  � m  KL� 
�  
ctxt�#  �"  � m  MP�� ���  :� o  QT�� 0 	imagename 	imageName� o  UX�� 0 output_extension  � o      �� 0 image_to_process  � ��� r  ^g��� l ^c���� n  ^c��� 1  ac�
� 
psxp� o  ^a�� 0 image_to_process  �  �  � o      �� 0 image_to_process_posix_path  � ��� l hh����  �  �  � ��� l hh����  � !  set pixel_padding on image   � ��� 6   s e t   p i x e l _ p a d d i n g   o n   i m a g e� ��� r  ho��� m  hk�� ���  7 5� o      �� 0 pixel_padding  � ��� l pp����  �  �  � ��� O  p���� T  v��� Z  {������ l {����� I {����
� .coredoexnull���     obj � 4  {��
�
�
 
file� o  ��	�	 0 image_to_process  �  �  �  �  S  ���  � I �����
� .sysodelanull��� ��� nmbr� m  ���� ?��������  � m  ps���                                                                                  MACS  alis    @  Macintosh HD                   BD ����
Finder.app                                                     ����            ����  
 cu             CoreServices  )/:System:Library:CoreServices:Finder.app/    
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  � ��� l ������  �  �  � ��� l ������  �   run Python script   � ��� $   r u n   P y t h o n   s c r i p t� ��� r  ����� I �����
� .sysoexecTEXT���     TEXT� b  ����� b  ����� b  ����� m  ���� ��� / U s e r s / j e r e m y / m i n i c o n d a 3 / e n v s / n e g a t i v e s / b i n / p y t h o n 3   / U s e r s / j e r e m y / D o c u m e n t s / G i t H u b / u t k _ B e n n e t t P h o t o g r a p h C o l l e c t i o n / k m e a n s _ a u t o c r o p . p y  � o  ��� �  0 image_to_process_posix_path  � m  ���� �      - p  � o  ������ 0 pixel_padding  �  � o      ����  0 autocropresult autocropResult�  l ����������  ��  ��    l ������   > 8 get capture one values for crop box from autocropResult    � p   g e t   c a p t u r e   o n e   v a l u e s   f o r   c r o p   b o x   f r o m   a u t o c r o p R e s u l t 	 r  ��

 n �� 4  ����
�� 
cobj m  ������  n  �� 2 ����
�� 
cpar o  ������  0 autocropresult autocropResult o      ���� 0 autocrop_rotation_angle  	  r  �� l ������ c  �� n �� 4  ����
�� 
cobj m  ������  n  �� 2 ����
�� 
cpar o  ������  0 autocropresult autocropResult m  ����
�� 
nmbr��  ��   o      ���� 0 autocrop_center_x    r  ��  l ��!����! c  ��"#" n ��$%$ 4  ����&
�� 
cobj& m  ������ % n  ��'(' 2 ����
�� 
cpar( o  ������  0 autocropresult autocropResult# m  ����
�� 
nmbr��  ��    o      ���� 0 autocrop_center_y   )*) r  ��+,+ l ��-����- c  ��./. n ��010 4  ����2
�� 
cobj2 m  ������ 1 n  ��343 2 ����
�� 
cpar4 o  ������  0 autocropresult autocropResult/ m  ����
�� 
nmbr��  ��  , o      ���� 0 autocrop_width  * 565 r  �787 l �9����9 c  �:;: n �
<=< 4  
��>
�� 
cobj> m  	���� = n  �?@? 2 ��
�� 
cpar@ o  �����  0 autocropresult autocropResult; m  
��
�� 
nmbr��  ��  8 o      ���� 0 autocrop_height  6 ABA l ��������  ��  ��  B CDC r  "EFE o  ���� 0 autocrop_rotation_angle  F n      GHG 1  !��
�� 
CVroH n  IJI 1  ��
�� 
vsetJ o  ���� 0 
thevariant 
theVariantD KLK r  #7MNM J  #3OO PQP o  #&���� 0 autocrop_center_x  Q RSR o  &)���� 0 autocrop_center_y  S TUT o  ),���� 0 autocrop_width  U V��V o  ,/���� 0 autocrop_height  ��  N o      ���� 0 autocrop_box  L WXW r  8CYZY o  8;���� 0 autocrop_box  Z n      [\[ 1  >B��
�� 
vcrp\ o  ;>���� 0 
thevariant 
theVariantX ]^] r  DS_`_ m  DG��
�� CfleCflh` n      aba 1  NR��
�� 
CVflb n  GNcdc 1  JN��
�� 
vsetd o  GJ���� 0 
thevariant 
theVariant^ e��e l TT��������  ��  ��  ��  
�n 
CBcc" m   � ����� # I  � ���f��
�� .corecnte****       ****f o   � ����� $0 selectedvariants selectedVariants��  �m    ghg l [[��ij��  i   4. close session   j �kk "   4 .   c l o s e   s e s s i o nh l��l l [[��mn��  m  close   n �oo 
 c l o s e��   P 1    !��
�� 
Cudo��   0 m     pp�                                                                                  C1PR  alis    B  Macintosh HD                   BD ����Capture One 12.app                                             ����            ����  
 cu             Applications  "/:Applications:Capture One 12.app/  &  C a p t u r e   O n e   1 2 . a p p    M a c i n t o s h   H D  Applications/Capture One 12.app   / ��  ��  ��   - qrq l     ��������  ��  ��  r sts l     ��uv��  u   open session   v �ww    o p e n   s e s s i o nt xyx l     ��z{��  z ' !tell application "Capture One 12"   { �|| B t e l l   a p p l i c a t i o n   " C a p t u r e   O n e   1 2 "y }~} l     �����    	open sessionPosixPath   � ��� , 	 o p e n   s e s s i o n P o s i x P a t h~ ���� l     ������  �  end tell   � ���  e n d   t e l l��       �������  � ����
�� 
pimr
�� .aevtoappnull  �   � ****� ����� �  ��� �� $��
�� 
vers��  � �����
�� 
cobj� ��   ��
�� 
osax��  � �����������
�� .aevtoappnull  �   � ****� k    ^��  ,����  ��  ��  � ��
�� 
CBcc� Dp���� F�������������������������� ���������������������i���������������~�}�|�{��z��y�x��w�v��u���t�s�r�q�p�o�n�m�l�k�j�i�h�g
�� 
csev�� $0 selectedvariants selectedVariants
�� .sysodlogaskr        TEXT
�� 
Cudo
�� 
COdf
�� 
ctxt
�� 
pnam�� 0 sessionpath sessionPath
�� 
psxp�� $0 sessionposixpath sessionPosixPath
�� 
COrp
�� .corecnte****       ****
�� 
cobj�� 0 	therecipe 	theRecipe
�� 
CRen��  0 autocroprecipe autocropRecipe
�� 
Cure�� 0 
recipename 
recipeName
�� 
CRrf
�� 
CRsf�� 0 recipe_output_folder  �� 0 
thevariant 
theVariant�� 0 	imagename 	imageName
�� 
ID  �� 0 variantuuid variantUUID
�� .sysonotfnull��� ��� TEXT
�� .coredoexnull���     obj 
�� 
cfol�  
�� .coredelonull���     obj 
�� 
vset
� 
CVro
�~ CfleCfln
�} 
CVfl
�| .Cap1procnull���     ****�{ 0 	theresult 	theResult�z 0 output_extension  �y 0 image_to_process  �x 0 image_to_process_posix_path  �w 0 pixel_padding  
�v 
file
�u .sysodelanull��� ��� nmbr
�t .sysoexecTEXT���     TEXT�s  0 autocropresult autocropResult
�r 
cpar�q 0 autocrop_rotation_angle  
�p 
nmbr�o 0 autocrop_center_x  �n 0 autocrop_center_y  �m �l 0 autocrop_width  �k �j 0 autocrop_height  �i 0 autocrop_box  
�h 
vcrp
�g CfleCflh��_�[*�,EE�O�jv  �j OPY hO*�,:*�,�&*�,%E�O��,E�O %k*�-j kh  *�-�E/E�Of�a ,F[OY��Oa E` O*�_ /*a ,FOe*a ,a ,FO*a ,�,EE` O*a ,a ,�&*a ,a ,%E` O�k�j kh  ��E/E` O_ �,E` O_ a ,E` Oa _ %j Oa  +_ j   *a  _ /�-a ![�,\Z_ >1j "Y hUOa #_ a $,a %,FOa &_ a $,a ',FO_ a el (E` )Oa *E` +O_ �&a ,%_ %_ +%E` -O_ -�,E` .Oa /E` 0Oa  & #hZ*a 1_ -/j  Y 	a 2j 3[OY��UOa 4_ .%a 5%_ 0%j 6E` 7O_ 7a 8-�k/E` 9O_ 7a 8-�l/a :&E` ;O_ 7a 8-�m/a :&E` <O_ 7a 8-�a =/a :&E` >O_ 7a 8-�a ?/a :&E` @O_ 9_ a $,a %,FO_ ;_ <_ >_ @a =vE` AO_ A_ a B,FOa C_ a $,a ',FOP[OY�XOPUU ascr  ��ޭ