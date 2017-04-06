using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace RecycleWeb.util
{
    public class WebApiUtil
    {
        public static bool HttpGet(string url, out string Msg)
        {
            bool _flag = false;
            HttpWebRequest req = WebRequest.Create(url) as HttpWebRequest;
            //req.Headers.Add("Access-Control-Allow-Origin", "*");
            //req.Headers.Add("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
            //req.Headers.Add("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
            using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
            {
                //resp.Headers.Add("Access-Control-Allow-Origin", "*");
                //resp.Headers.Add("Access-Control-Allow-Headers", "origin, x-requested-with, content-type, accept");
                //resp.Headers.Add("Access-Control-Allow-Methods", "GET,POST,PUT,DELETE,OPTIONS");
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    _flag = true;
                }
                StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                Msg = reader.ReadToEnd();
            }
            return _flag;
        }

        public static bool HttpPost(string url, Dictionary<string, string> paramList, out string Msg)
        {
            bool _flag = false;
            try
            {
                HttpWebRequest req = WebRequest.Create(new Uri(url)) as HttpWebRequest;
                req.Method = "POST";
                req.ContentType = "application/x-www-form-urlencoded; charset=UTF-8";

                // Build a string with all the params, properly encoded.
                // We assume that the arrays paramName and paramVal are
                // of equal length:
                StringBuilder paramz = new StringBuilder();
                foreach (KeyValuePair<string, string> param in paramList)
                {
                    paramz.Append(param.Key);
                    paramz.Append("=");
                    //paramz.Append(System.Web.HttpUtility.UrlEncode(param.Value));
                    paramz.Append(param.Value);
                    paramz.Append("&");
                }

                // Encode the parameters as form data:
                byte[] formData = UTF8Encoding.UTF8.GetBytes(paramz.ToString());
                req.ContentLength = formData.Length;

                // Send the request:
                using (Stream post = req.GetRequestStream())
                {
                    post.Write(formData, 0, formData.Length);
                    post.Flush();
                }

                // Pick up the response:
                using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
                {
                    if (resp.StatusCode == HttpStatusCode.OK)
                    {
                        _flag = true;
                    }
                    StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                    Msg = reader.ReadToEnd();
                }
            }
            catch (Exception e)
            {
                throw e;
            }

            return _flag;
        }

        public static bool HttpPost(string url, object obj, out string Msg)
        {
            bool _flag = false;
            HttpWebRequest req = WebRequest.Create(new Uri(url)) as HttpWebRequest;
            req.Method = "POST";
            req.ContentType = "application/json; charset=UTF-8";
            req.Headers["Authorization"] = "Bearer " + obj.ToString();
            // Build a string with all the params, properly encoded.
            // We assume that the arrays paramName and paramVal are
            // of equal length:
            string jsonString = string.Empty; // new JavaScriptSerializer().Serialize("");

            //StringBuilder paramz = new StringBuilder();
            //paramz.Append("param=");
            //paramz.Append(System.Web.HttpUtility.UrlEncode(jsonString));

            // Encode the parameters as form data:
            //byte[] formData = UTF8Encoding.UTF8.GetBytes(paramz.ToString());
            //req.ContentLength = formData.Length;

            // Send the request:
            //using (Stream post = req.GetRequestStream())
            //{
            //    post.Write(formData, 0, formData.Length);
            //    post.Flush();
            //}

            // Pick up the response:
            try
            {
                using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
                {
                    if (resp.StatusCode == HttpStatusCode.OK)
                    {
                        _flag = true;
                    }
                    StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                    Msg = reader.ReadToEnd();
                }
            }
            catch (WebException e)
            {
                Console.Write(e.Message);
                Msg = string.Empty;
            }

            return _flag;
        }

        public static bool HttpPostJSON(string url, Dictionary<string, string> paramList, out string Msg)
        {
            bool _flag = false;
            HttpWebRequest req = WebRequest.Create(new Uri(url)) as HttpWebRequest;
            req.Method = "POST";
            req.ContentType = "application/json; charset=UTF-8";

            // Build a string with all the params, properly encoded.
            // We assume that the arrays paramName and paramVal are
            // of equal length:
            string param = JsonConvert.SerializeObject(paramList, Formatting.Indented);

            // Encode the parameters as form data:
            byte[] formData = UTF8Encoding.UTF8.GetBytes(param);
            req.ContentLength = formData.Length;

            // Send the request:
            using (Stream post = req.GetRequestStream())
            {
                post.Write(formData, 0, formData.Length);
                post.Flush();
            }

            // Pick up the response:
            using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
            {
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    _flag = true;
                }
                StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                Msg = reader.ReadToEnd();
            }

            return _flag;
        }

        // MD5 암호화 128bit 암호화
        public static string MD5Hash(string Data)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] hash = md5.ComputeHash(Encoding.ASCII.GetBytes(Data));

            StringBuilder stringBuilder = new StringBuilder();
            foreach (byte b in hash)
            {
                stringBuilder.AppendFormat("{0:x2}", b);
            }
            return stringBuilder.ToString();
        }

        // SHA256 256bit 암호화
        public static string SHA256Hash(string Data)
        {
            SHA256 sha = new SHA256Managed();
            byte[] hash = sha.ComputeHash(Encoding.ASCII.GetBytes(Data));

            StringBuilder stringBuilder = new StringBuilder();
            foreach (byte b in hash)
            {
                stringBuilder.AppendFormat("{0:x2}", b);
            }
            return stringBuilder.ToString();
        }
    }
}