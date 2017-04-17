using Newtonsoft.Json;
using RecycleWeb.Member;
using RestSharp;
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
        // 카카오 - 오류메세지
        public static string GetErrorMsg(int error)
        {
            string msg = string.Empty;
            switch(error)
            {
                case -1:
                    msg = "내부 처리 오류.에러 코드로 상세 분류되어 있지 않은 경우(400)";
                    break;
                case -2:
                    msg = "잘못된 파라미터. 호출 인자값이 잘못되었거나 필수 인자가 포함되지 않은 경우(400)";
                    break;
                case -3:
                    msg = "지원되지 않는 서비스 API에 대한 호출. 해당 앱의 호출된 API가 설정에서 off되어 있을 경우(400)";
                    break;
                case -4:
                    msg = "계정 제재 또는 특정 서비스에서 해당 사용자의 제재로 인해 API 호출이 금지된 경우(400)";
                    break;
                case -5:
                    msg = "해당 API에 대한 권한/ 퍼미션이 없는 경우(403)";
                    break;
                case -10:
                    msg = "허용된 요청 횟수가 초과된 경우.자세한 내용은 쿼터 및 제한을 참고(400)";
                    break;
                case -101:
                    msg = "해당 앱에 연결이 되지 않은 사용자의 요청.로그인 기반 API의 경우 앱 연결이 선행되어야 함(400)";
                    break;
                case -102:
                    msg = "이미 해당 앱에 연결된(가입 / 등록) 사용자가 재연결을 시도할 경우(400)";
                    break;
                case -103:
                    msg = "존재하지 않는 카카오계정에 대한 호출(400)";
                    break;
                case -201:
                    msg = "사용자 관리 API 호출시 파라미터가 부적절히 구성되었을 경우.주로 개발자 웹사이트의(내 애플리케이션 > 설정 > 사용자 관리)에서 사용자 정보의 설정과 요청의 파라미터가 불일치 할 경우 발생(400)";
                    break;
                case -301:
                    msg = "등록되지 않은 앱키의 요청 또는 존재하지 않는 앱으로의 요청(400)";
                    break;
                case -401:
                    msg = "사용자 토큰이 잘못되었을 경우.주로 만료된 토큰에 대한 요청(401)";
                    break;
                case -402:
                    msg = "해당 API에 대한 사용자의 동의 퍼미션이 없는 경우(403)";
                    break;
                case -403:
                    msg = "등록되지 않은 사이트에서의 API 호출이 있을 경우(403)";
                    break;
                case -501:
                    msg = "카카오톡 미가입 사용자가 카카오톡 API를 호출 하였을 경우(400)";
                    break;
                case -601:
                    msg = "카카오스토리 미가입 사용자가 카카오스토리 API를 호출 하였을 경우(400)";
                    break;
                case -602:
                    msg = "카카오스토리 이미지 업로드시 최대 용량(현재 10MB)을 초과하였을 경우(400)";
                    break;
                case -603:
                    msg = "카카오스토리 이미지 업로드 / 스크랩 정보 요청시 타임아웃 발생(400)";
                    break;
                case -604:
                    msg = "카카오스토리에서 스크랩이 실패하였을 경우(400)";
                    break;
                case -605:
                    msg = "카카오스토리에 존재하지 않는 내스토리를 요청을 했을 경우(400)";
                    break;
                case -606:
                    msg = "카카오스토리 이미지 업로드시, 최대 이미지 갯수(현재 5개.단, gif 파일은 1개)를 초과하였을 경우(400)";
                    break;
                case -701:
                    msg = "결제인증이 완료되지 않았는데 결제승인 API를 호출한 경우(400)";
                    break;
                case -702:
                    msg = "이미 결제 완료된 TID로 다시 결제승인 API를 호출한 경우(400)";
                    break;
                case -703:
                    msg = "결제승인 API 호출 시 포인트 금액이 잘못된 경우(400)";
                    break;
                case -704:
                    msg = "결제승인 API 호출 시 원결제수단(머니 / 카드)의 금액이 잘못된 경우(400)";
                    break;
                case -705:
                    msg = "결제승인 API 호출 시 지원하지 않는 결제수단으로 요청한 경우(400)";
                    break;
                case -706:
                    msg = "결제준비 API에서 요청한 partner_order_id 와 다른 값으로 결제승인 API 호출 한 경우(400)";
                    break;
                case -707:
                    msg = "결제준비 API에서 요청한 partner_user_id 와 다른 값으로 결제승인 API 호출 한 경우(400)";
                    break;
                case -708:
                    msg = "잘못된 pg_token 로 결제승인 API를 호출한 경우(400)";
                    break;
                case -710:
                    msg = "결제취소 API 호출 시 취소 요청 금액을 취소 가능액보다 큰 금액으로 요청한 경우(400)";
                    break;
                case -721:
                    msg = "TID가 존재하지 않는 경우(400)";
                    break;
                case -722:
                    msg = "금액 정보가 잘못된 경우(400)";
                    break;
                case -723:
                    msg = "결제 만료 시간이 지난 경우(400)";
                    break;
                case -724:
                    msg = "단건결제금액이 잘못된 경우(400)";
                    break;
                case -725:
                    msg = "총 결제금액이 잘못된 경우(400)";
                    break;
                case -726:
                    msg = "주문정보가 잘못된 경우(400)";
                    break;
                case -730:
                    msg = "가맹점 앱 정보가 잘못된 경우(400)";
                    break;
                case -731:
                    msg = "CID 가 잘못된 경우(400)";
                    break;
                case -732:
                    msg = "GID 가 잘못된 경우(400)";
                    break;
                case -750:
                    msg = "SID가 존재하지 않는 경우(400)";
                    break;
                case -751:
                    msg = "비활성화된 SID로 정기결제 API 를 호출한 경우(400)";
                    break;
                case -752:
                    msg = "SID가 월 최대 사용 횟수를 초과한 경우(400)";
                    break;
                case -753:
                    msg = "정기결제 API 호출시 partner_user_id가 SID를 발급받았던 최초 결제준비 API 에서 요청한 값과 다른 경우(400)";
                    break;
                case -761:
                    msg = "입력한 전화번호가 카카오톡에 가입하지 않은 경우(400)";
                    break;
                case -780:
                    msg = "결제승인 API 호출이 실패한 경우(500)";
                    break;
                case -781:
                    msg = "결제취소 API 호출이 실패한 경우(500)";
                    break;
                case -782:
                    msg = "정기결제 API 호출이 실패한 경우(500)";
                    break;
                case -783:
                    msg = "승인요청을 할 수 없는 상태에 결제승인 API를 호출한 경우(400)";
                    break;
                case -784:
                    msg = "취소요청을 할 수 없는 상태에 결제취소 API를 호출한 경우(400)";
                    break;
                case -785:
                    msg = "결제 / 취소를 중복으로 요청한 경우(400)";
                    break;
                case -798:
                    msg = "허용되지 않는 ip를 사용한 경우(400)";
                    break;
                case -799:
                    msg = "앱에 등록된 웹사이트 도메인과 같지 않은 경우(400)";
                    break;
                case -901:
                    msg = "등록된 푸시토큰이 없는 기기로 푸시 메시지를 보낸 경우(400)";
                    break;
                case -9798:
                    msg = "서비스 점검중(503)";
                    break;
            }

            return msg;
        }

        // 카카오 - 사용자 토큰 받기
        public static string GetAuthToken(string uri, string resource, Dictionary<string, string> param)
        {
            var client = new RestClient(uri);
            var request = new RestRequest(resource, Method.POST);
            foreach (var item in param)
            {
                request.AddParameter(item.Key, item.Value);
            }
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

        // 카카오 - 앱연결
        public static string SignUp(string uri, string resource, string accessToken)
        {
            var client = new RestClient(uri);
            var request = new RestRequest(resource, Method.POST);
            request.AddHeader("Authorization", string.Format("Bearer {0}", accessToken));
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

        // 카카오 - 사용자 정보 요청
        public static string RequestMe(string uri, string resource, string accessToken)
        {
            var client = new RestClient(uri);
            var request = new RestRequest(resource, Method.POST);
            request.AddHeader("Authorization", string.Format("Bearer {0}", accessToken));
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

        public static string RestRequest(string uri, string resource, Dictionary<string, string> param)
        {
            var client = new RestClient(uri);
            var request = new RestRequest();
            request.RequestFormat = DataFormat.Json;
            request.AddBody(param);
            request.Resource = resource;
            request.Method = Method.POST;
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

        // 카카오 - 로그아웃
        public static string Logout(string uri, string resource, string accessToken)
        {
            var client = new RestClient(uri);
            var request = new RestRequest(resource, Method.POST);
            request.AddHeader("Authorization", string.Format("Bearer {0}", accessToken));
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

        // 카카오 - 언링크
        public static string Unlink(string uri, string resource, string accessToken)
        {
            var client = new RestClient(uri);
            var request = new RestRequest(resource, Method.POST);
            request.AddHeader("Authorization", string.Format("Bearer {0}", accessToken));
            IRestResponse response = client.Execute(request);
            var content = response.Content;

            return content;
        }

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

        public static void HttpCall(object obj, out string Msg)
        {            
            var client = new RestClient("https://kapi.kakao.com");

            var request = new RestRequest("v1/user/signup", Method.POST);
            request.AddHeader("Authorization", string.Format("Bearer {0}", obj.ToString()));

            IRestResponse response = client.Execute(request);
            var content = response.Content;

            Msg = content;
        }

        public static bool HttpPostAuthHeader(string url, object obj, out string Msg)
        {
            bool _flag = false;
            HttpWebRequest req = WebRequest.Create(new Uri(url)) as HttpWebRequest;
            req.Method = "POST";
            req.ContentType = "application/x-www-form-urlencoded; charset=UTF-8";
            req.Headers["Authorization"] = string.Format("Bearer {0}", obj.ToString());
            // Build a string with all the params, properly encoded.
            // We assume that the arrays paramName and paramVal are
            // of equal length:
            //string jsonString =  new JavaScriptSerializer().Serialize("");

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
                //using (HttpWebResponse resp = req.GetResponse() as HttpWebResponse)
                //{
                //    if (resp.StatusCode == HttpStatusCode.OK)
                //    {
                //        _flag = true;
                //    }
                //    StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                //    Msg = reader.ReadToEnd();
                //}
                HttpWebResponse resp = req.GetResponse() as HttpWebResponse;
                if (resp.StatusCode == HttpStatusCode.OK)
                {
                    _flag = true;
                }
                StreamReader reader = new StreamReader(resp.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
                Msg = reader.ReadToEnd();
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