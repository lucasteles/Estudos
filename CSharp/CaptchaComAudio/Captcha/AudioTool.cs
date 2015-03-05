using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NAudio.Wave;
using System.Web.Mvc;
using System.IO;
using NAudio.Wave.SampleProviders;
using System.Diagnostics;


namespace BradescoCadastro
{
    public static class AudioTool
    {

        public static string GenerateAudio(ControllerContext context, string captcha)
        {
            var mixed =  Path.GetTempFileName();
            var back = Path.GetTempFileName();
            var main = Path.GetTempFileName();
            


            //gera audio principal
            List<String> chars = new List<string>();
            foreach (var item in captcha)
            {
                chars.Add(context.HttpContext.Server.MapPath("~/Content/Audios/" + item.ToString() + ".wav"));
                
            }
            Concatenate(main, chars, 1000);

            chars = new List<string>();
            //gera audio aleatorio para sujeira
            for (int i = 0; i < 4; i++)
            {
                var randtext = Captcha.GenerateRandomCode(i);
                foreach (var item in randtext)
                {
                    chars.Add(context.HttpContext.Server.MapPath("~/Content/Audios/" + item.ToString() + ".wav"));
                }   
            }
            Concatenate(mixed, chars, 0, true);
            ReverseWaveFile(mixed, back);
           

            using (var reader1 = new WaveFileReader(main))
            using (var reader2 = new WaveFileReader(back))
            {

                var volumeProvider = new VolumeSampleProvider(reader2.ToSampleProvider());
                volumeProvider.Volume = 0.15f;

                var inputs = new List<ISampleProvider>() {
                    reader1.ToSampleProvider(),
                    volumeProvider
                };


                var mixer = new MixingSampleProvider(inputs);
                WaveFileWriter.CreateWaveFile16(mixed, mixer);
            }

            var mp3file = Path.GetTempFileName();
            WavToMp3(mixed, mp3file, context);

            return mp3file;
        }


        public static void Concatenate(String outputFile, IEnumerable<string> sourceFiles, int mseconds = 0, bool reverse = false)
        {
            byte[] buffer = new byte[1024];
            WaveFileWriter waveFileWriter = null;

            try
            {
                foreach (string sourceFile in sourceFiles)
                {
                    using (WaveFileReader reader = new WaveFileReader(sourceFile))
                    {
                        if (waveFileWriter == null)
                        {

                            waveFileWriter = new WaveFileWriter(outputFile, reader.WaveFormat);
                        }
                        else
                        {
                            if (!reader.WaveFormat.Equals(waveFileWriter.WaveFormat))
                            {
                                throw new InvalidOperationException("Can't concatenate WAV Files that don't share the same format");
                            }
                        }

                        if (mseconds > 0)
                        {

                            int avgBytesPerMillisecond = reader.WaveFormat.AverageBytesPerSecond / 1000;
                            var silenceArraySize = avgBytesPerMillisecond * mseconds;
                            byte[] silenceArray = new byte[silenceArraySize];
                            waveFileWriter.Write(silenceArray, 0, silenceArray.Length);
                        }

                        int read;
                        while ((read = reader.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            waveFileWriter.Write(buffer, 0, read);
                        }

                    }


                }
            }
            finally
            {
                if (waveFileWriter != null)
                {
                    waveFileWriter.Dispose();
                }
            }
        }

        public static void ReverseWaveFile(string inputFile, string outputFile)
        {
            using (WaveFileReader reader = new WaveFileReader(inputFile))
            {
                int blockAlign = reader.WaveFormat.BlockAlign;
                using (WaveFileWriter writer = new WaveFileWriter(outputFile, reader.WaveFormat))
                {
                    byte[] buffer = new byte[blockAlign];
                    long samples = reader.Length / blockAlign;
                    for (long sample = samples - 1; sample >= 0; sample--)
                    {
                        reader.Position = sample * blockAlign;
                        reader.Read(buffer, 0, blockAlign);
                        writer.Write(buffer, 0, blockAlign);
                    }
                }
            }
        }

        private static void WavToMp3(string wavFile, string outmp3File, ControllerContext context)
        {
            ProcessStartInfo psi = new ProcessStartInfo();
            psi.FileName = context.HttpContext.Server.MapPath(@"~\Content\lame.exe");
            psi.Arguments = "-V2  " + wavFile + " " + outmp3File;
            psi.WindowStyle = ProcessWindowStyle.Hidden;
            
            psi.UseShellExecute = false;
            psi.CreateNoWindow = true;
            
            Process p = Process.Start(psi);
            p.WaitForExit();

            

         
        }
 

        
    }
}