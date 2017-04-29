using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecycleWeb.Collection
{
    public partial class RequestDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kakaoId"] != null && Request.Form.AllKeys.Length > 0)
            {
                string productList = string.Empty;
                for (int i = 0; i < Request.Form.AllKeys.Length; i++) {
                    if (Request.Form[i] != null)
                    {
                        switch (Request.Form.Keys[i])
                        {
                            case "txtProduct06":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("헌옷 {0}, ", Request.Form[i]);
                                    this.hdProduct06.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct07":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("휴대폰 {0}, ", Request.Form[i]);
                                    this.hdProduct07.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct09":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("소형가전 {0}, ", Request.Form[i]);
                                    this.hdProduct09.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct08":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("대형가전 {0}, ", Request.Form[i]);
                                    this.hdProduct08.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct01":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("폐지 {0}, ", Request.Form[i]);
                                    this.hdProduct01.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct02":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("병 {0}, ", Request.Form[i]);
                                    this.hdProduct02.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct04":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("고철 {0}, ", Request.Form[i]);
                                    this.hdProduct04.Value = Request.Form[i];
                                }
                                break;
                            case "txtProduct05":
                                if (int.Parse(Request.Form[i].ToString()) > 0)
                                {
                                    productList += string.Format("비철 {0}, ", Request.Form[i]);
                                    this.hdProduct05.Value = Request.Form[i];
                                }
                                break;
                            case "chkProduct10":
                                if (Request.Form[i].Equals("on"))
                                {
                                    productList += "이삿짐, ";
                                    this.hdProduct10.Value = "1";
                                }
                                break;
                            case "chkEtc1":
                                if (Request.Form[i].Equals("on"))
                                {
                                    productList += "가구류/기타, ";
                                    this.hdEtc1.Value = "1";
                                }
                                break;
                            case "chkEtc2":
                                if (Request.Form[i].Equals("on"))
                                {
                                    productList += "폐기서비스, ";
                                    this.hdEtc2.Value = "1";
                                }
                                break;
                            case "chkEtc3":
                                if (Request.Form[i].Equals("on"))
                                {
                                    productList += "유품정리, ";
                                    this.hdEtc3.Value = "1";
                                }
                                break;
                        }
                    }
                }

                //productList = productList.Substring(0, productList.LastIndexOf(", "));

                this.hdProducerIdx.Value = Session["producerIdx"].ToString();
                this.hdAddress1.Value = Session["address1"].ToString();
                this.hdAddress2.Value = Session["address2"].ToString();

                this.txtReqProduct.Value = productList.Substring(0, productList.Length - 2);
                this.txtName.Value = Session["name"].ToString();

                string[] contactNumber;
                if (Session["producerContactNumber"].ToString().Length == 13)
                {
                    contactNumber = Session["producerContactNumber"].ToString().Split('-');

                    if (contactNumber.Length >= 3)
                    {
                        this.txtContactNumber1.Value = contactNumber[0];
                        this.txtContactNumber2.Value = contactNumber[1];
                        this.txtContactNumber3.Value = contactNumber[2];
                    }
                }
                this.txtBaseAddress.Value = string.Format("{0} {1}", Session["address1"].ToString(), Session["address2"].ToString());
                this.txtDetailAddress.Value = Session["detailAddress"].ToString();
                this.txtZipno.Value = Session["zipCode"].ToString();
            }
            else
            {
                Response.Redirect("/Default.aspx");
                //ScriptManager.RegisterStartupScript(
                //    this,
                //    GetType(),
                //    "alert",
                //    "chkLogin();",
                //    true
                //);
            }
        }
    }
}