using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace _2018_12_13.Comon
{
    public static class Comon
    {
        public static List<string> GetAllDirectoryInFolder(string directory)
        {
            try
            {
                FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(Global.sys_ServerImageFolder + directory);
                ftpRequest.Credentials = new NetworkCredential(Global.sys_ServerImageUserName, Global.sys_ServerImagePassword);
                ftpRequest.Method = WebRequestMethods.Ftp.ListDirectory;
                FtpWebResponse response = (FtpWebResponse)ftpRequest.GetResponse();
                StreamReader streamReader = new StreamReader(response.GetResponseStream());
                List<string> directories = new List<string>();
                string line = streamReader.ReadLine();
                while (!string.IsNullOrEmpty(line))
                {
                    directories.Add(line);
                    line = streamReader.ReadLine();
                }

                streamReader.Close();
                return directories;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static bool CheckDirectoryFTP(string customer, string directory)
        {
            List<string> currrentdirectories = GetAllDirectoryInFolder(customer);
            // Chua co folder customer
            if (currrentdirectories == null)
            {
                CreateDirectoryFTP(customer);
                currrentdirectories = GetAllDirectoryInFolder(customer);
            }
            // Co roi nhung chua co 1 folder hinh anh nao
            if (currrentdirectories.Count == 0)
            {
                CreateDirectoryFTP(customer + "/" + directory);
                return true;
            }
            else
            {
                bool resulf = false;
                foreach (var dr in currrentdirectories)
                {
                    if (dr == directory)
                        resulf = true;
                }
                if (resulf) return false; // Trung folder
                else
                {
                    CreateDirectoryFTP(customer + "/" + directory);
                    return true;
                }
            }
        }
        public static bool CreateDirectoryFTP(string directory)
        {
            WebRequest request = WebRequest.Create(Global.sys_ServerImageFolder + directory);
            request.Method = WebRequestMethods.Ftp.MakeDirectory;
            request.Credentials = new NetworkCredential(Global.sys_ServerImageUserName, Global.sys_ServerImagePassword);
            try
            {
                request.GetResponse();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        // customer + foldername
        public static List<string> GetImageFromDirectory(string directory)
        {
            List<string> stringName = new List<string>();
            stringName = GetAllDirectoryInFolder(directory);
            if (stringName == null)
            {
                return null;
            }
            for (int i = 0; i < stringName.Count; i++)
            {
                stringName[i] = String.Format(@"{0}{1}/{2}", Global.sys_HTTPImageRoot, directory, stringName[i]);
            }
            return stringName;
        }
        public static DateTime GetDateTimeNow()
        {
            return DateTime.Now;
        }

        public static string ConvertToUnsign(string str)
        {
            str = str.Replace("'", "");
            string[] signs = new string[]
                {
                    "aAeEoOuUiIdDyY",
                    "áàạảãâấầậẩẫăắằặẳẵ",
                    "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",
                    "éèẹẻẽêếềệểễ",
                    "ÉÈẸẺẼÊẾỀỆỂỄ",
                    "óòọỏõôốồộổỗơớờợởỡ",
                    "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",
                    "úùụủũưứừựửữ",
                    "ÚÙỤỦŨƯỨỪỰỬỮ",
                    "íìịỉĩ",
                    "ÍÌỊỈĨ",
                    "đ",
                    "Đ",
                    "ýỳỵỷỹ",
                    "ÝỲỴỶỸ"
                };
            for (int i = 1; i < signs.Length; i++)
            {
                for (int j = 0; j < signs[i].Length; j++)
                {
                    str = str.Replace(signs[i][j], signs[0][i - 1]);
                }
            }
            return str;
        }

        // COnvert Image Format
        public static Stream ConvertImage(Stream originalStream, ImageFormat format)
        {
            var image = Image.FromStream(originalStream);
            var stream = new MemoryStream();
            image.Save(stream, format);
            stream.Position = 0;
            return stream;
        }
        // Resize Image
        public static string ResizeImage(byte[] byteArrayIn, int width, int height)
        {
            using (var ms = new MemoryStream(byteArrayIn))
            {
                Image image = Image.FromStream(ms);
                var destRect = new Rectangle(0, 0, width, height);
                var destImage = new Bitmap(width, height);
                destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);
                using (var graphics = Graphics.FromImage(destImage))
                {
                    graphics.CompositingMode = CompositingMode.SourceCopy;
                    graphics.CompositingQuality = CompositingQuality.HighQuality;
                    graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    graphics.SmoothingMode = SmoothingMode.HighQuality;
                    graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                    using (var wrapMode = new ImageAttributes())
                    {
                        wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                        graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
                    }
                }
                Bitmap bImage = destImage; 
                System.IO.MemoryStream ms1 = new MemoryStream();
                bImage.Save(ms1, ImageFormat.Jpeg);
                byte[] byteImage = ms1.ToArray();
                var SigBase64 = Convert.ToBase64String(byteImage);
                return SigBase64;
            }
        }


    }
}