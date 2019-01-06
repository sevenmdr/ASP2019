using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;

namespace _2018_12_13
{
    /// <summary>
    /// Summary description for FileUploadHandler
    /// </summary>
    public class FileUploadHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {

                //if (context.Request.QueryString["upload"] != null)
                if (context.Request.Files[0] != null)
                {
                    string customerID = context.Request.QueryString["CustomerID"];
                    string folderName = context.Request.QueryString["FolderName"];
                    string Type = context.Request.QueryString["Type"];
                    if (Type == null || Type == "undefined")
                    {
                        context.Response.Write("0");
                        return;
                    }
                    if (Type == "Image" && (customerID == null || folderName == null || folderName == "undefined" || customerID == "undefined"))
                    {
                        context.Response.Write("0");
                        return;
                    }


                    string pathrefer = context.Request.UrlReferrer.ToString();
                    string Serverpath = HttpContext.Current.Server.MapPath("UploadedFiles");

                    var postedFile = context.Request.Files[0];

                    string file;

                    //In case of IE
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE")
                    {
                        string[] files = postedFile.FileName.Split(new char[] {
                '\\'
            });
                        file = files[files.Length - 1];
                    }
                    else // In case of other browsers
                    {
                        file = postedFile.FileName;
                    }


                    if (!Directory.Exists(Serverpath))
                        Directory.CreateDirectory(Serverpath);

                    string fileDirectory = Serverpath;
                    if (context.Request.QueryString["fileName"] != null)
                    {
                        file = context.Request.QueryString["fileName"];
                        if (File.Exists(fileDirectory + "\\" + file))
                        {
                            File.Delete(fileDirectory + "\\" + file);
                        }
                    }

                    string ext = (Path.GetExtension(fileDirectory + "\\" + file)).ToLower() ;
                    if (ext != ".jpg" && ext != ".png" && ext != ".jpeg")
                    {
                        context.Response.Write("0");
                        return;
                    }
                    var fileLength = context.Request.ContentLength;
                    if(fileLength> 5000000)
                    {
                        context.Response.Write("0");
                        return;
                    }
                    file = Guid.NewGuid() + ext;
                    if(Type== "Avatar")
                    {
                        using (var binaryReader = new BinaryReader(
                            Comon.Comon.ConvertImage(context.Request.Files[0].InputStream, System.Drawing.Imaging.ImageFormat.Jpeg)))
                        {
                            byte[] fileData = null;
                            fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                            string base64String = Comon.Comon.ResizeImage(fileData, 100, 150);
                            context.Response.Write(base64String);
                        }

                        
                    }
                    else if (Type == "Image")
                    {
                        using (var binaryReader = new BinaryReader(context.Request.Files[0].InputStream))
                        {
                            byte[] fileData = null;
                            fileData = binaryReader.ReadBytes(context.Request.Files[0].ContentLength);
                            FtpWebRequest req = (FtpWebRequest)WebRequest.Create(String.Format(@"{0}{1}/{2}/{3}", Comon.Global.sys_ServerImageFolder, customerID, folderName, file));
                            req.UseBinary = true;
                            req.Method = WebRequestMethods.Ftp.UploadFile;
                            req.Credentials = new NetworkCredential(Comon.Global.sys_ServerImageUserName, Comon.Global.sys_ServerImagePassword);
                            req.ContentLength = fileData.Length;
                            Stream reqStream = req.GetRequestStream();
                            reqStream.Write(fileData, 0, fileData.Length);
                            reqStream.Close();
                        }
                        context.Response.Write("1");
                    }
                    else context.Response.Write("0");
                    try
                    {
                        if (context.Request["HTTP_ACCEPT"].Contains("application/json"))
                            context.Response.ContentType = "application/json";
                        else
                            context.Response.ContentType = "text/plain";
                    }
                    catch
                    {
                        context.Response.ContentType = "text/plain";
                    }
                }
            }
            catch (Exception exp)
            {
                context.Response.Write("0");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

    }
}