#!/bin/bash
echo "extract images"
./ffmpeg -ss $1 -i ./190110.mp4 -vframes 1 -f image2 ./origin_$1_orig.png
convert -rotate 270 ./origin_$1_orig.png ./origin_$1.png
rm ./origin_$1_orig.png
./ffmpeg -ss $1 -i ./190110-rotate_h264.mp4 -vframes 1 -f image2 ./h264_$1.png
./ffmpeg -ss $1 -i ./190110-rotate_h265.mp4 -vframes 1 -f image2 ./h265_$1.png
echo "calc SSIM h264"
./ffmpeg -i ./origin_$1.png -i ./h264_$1.png -filter_complex ssim -an -f null -
echo "calc SSIM h265"
./ffmpeg -i ./origin_$1.png -i ./h265_$1.png -filter_complex ssim -an -f null -