# Tongue-Shape-Analysis-from-Ultrasound-Videos
1.Download raw data
  samples: "UltraSuite Repository - sample data"
  each recording contains: .param  
                           .ult(ultrasound image)  
                           .wav
                           .text(prompt text and recording time)    

2.Use ultrasuite-tools to transform those 4 files above into a video
  https://github.com/UltraSuite/ultrasuite-tools
  the major coding file is "utternace_animate.ipynb"
  the output video's suffix should be .avi

3.Apply the video into GetContours
  the command scentence is: GetContours('filename.avi', 'VNAME','filename_desigened by yourself')
  Get XY
  Calculate l
  eg. >> GetContours('C:\Users\AT75690\Desktop\inventory\uxtd\01M\atha.avi','VNAME','atha')
      >> writematrix([apa(50).XY,apa(60).XY,apa(70).XY,apa(80).XY,apa(90).XY],'C:\Users\AT75690\Desktop\inventory\uxtd\01M\apa.csv')


4.Add perturbation (in folder 'Perturbation'）
  1)5th oder polynomial extension/shortening
  2)exponential_1: go inside/outside
  3)exponential_2: swing to right/left (to tip/root)


5.Quantify the complexity of tongue shape (in folder 'analysis-4 measures')
  1)MCI&Fourier (Dawson's codes)
  2)DEI&LOC (refer to the paper by Zharkova)
  3)TF1, TF2, TF3

