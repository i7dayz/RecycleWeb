using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
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
        public static bool HttpPost(string url, Dictionary<string, string> paramList, out string Msg)
        {
            bool _flag = false;
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

            return _flag;
        }

        public static bool HttpPost(string url, object obj, out string Msg)
        {
            bool _flag = false;
            HttpWebRequest req = WebRequest.Create(new Uri(url)) as HttpWebRequest;
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded; charset=UTF-8";

            // Build a string with all the params, properly encoded.
            // We assume that the arrays paramName and paramVal are
            // of equal length:
            string jsonString = new JavaScriptSerializer().Serialize(obj);

            StringBuilder paramz = new StringBuilder();
            paramz.Append("param=");
            paramz.Append(System.Web.HttpUtility.UrlEncode(jsonString));

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

            return _flag;
        }
    }
}