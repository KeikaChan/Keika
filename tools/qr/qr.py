from pyzbar.pyzbar import decode
from PIL import Image
import sys
import os
argvs = sys.argv
for item in range(len(argvs)-1):	
	# QRコード(QRcode.png)の指定
	image = argvs[item+1]
	# QRコードの読取り
	data = decode(Image.open(image))
	# コード内容テキストファイル(output.txt)に出力
	if(len(data)!=0):
		f = open(str(image)+'-decode.txt','w')
		for st in data:
			print(st)
		s=data[0].data.hex()
		li = [(i+j) for (i,j) in zip(s[::2],s[1::2])]
		count = 0
		for hexs in li:
			f.write(hexs + " ")
			count+=1
			if(count%8==0):
				 f.write("\n")
		f.close()
