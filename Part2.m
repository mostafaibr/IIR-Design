info = audioinfo('ver2.wav')

info = 

  struct with fields:

             Filename: 'C:\Users\Mostafa\Desktop\Project\IIR Design\ver2.wav'
    CompressionMethod: 'Uncompressed'
          NumChannels: 1
           SampleRate: 22050
         TotalSamples: 1350001
             Duration: 61.2245
                Title: []
              Comment: []
               Artist: []
        BitsPerSample: 32

[x , Fs] = audioread('ver2.wav');
sound(x(1:5*Fs), Fs)
L = length(x);
NFFT = 2^nextpow2(L);  
X = fft(x, NFFT);
f = [0:NFFT/2-1]* Fs/NFFT;
plot(f, 20*log10(abs(X(1:NFFT/2))))
grid on
fdatool
y1=sosfilt(SOS1,x);
Y1= fft(y1, NFFT);
plot(f, 20*log10(abs(X(1:NFFT/2))) , f , 20*log10(abs(Y1(1:NFFT/2))))
freqz(SOS1)
fdatool
y2=sosfilt(SOS2,y1);
Y2= fft(y2, NFFT);
plot(f, 20*log10(abs(Y1(1:NFFT/2))) , f , 20*log10(abs(Y2(1:NFFT/2))))
freqz(SOS2)
sound(y2,Fs)
audiowrite('Ibrahim-Mostafa-Ghamloush-Moslem.wav', y2 , Fs, 'BitsPerSample', 32)
