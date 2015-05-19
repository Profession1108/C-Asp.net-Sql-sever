using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Login"] = 0;
        Session["Registration"] = 0;
        String cancel = Convert.ToString(Session["cancel"]);
        if (cancel == "1")
        {
            Response.Write("<script>alert('不能非法登入!');</script>");
            Session["cancel"] = 0;
        }else{}
                        
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }
    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "select count(*) from [Table] where UserName = '" + TextBoxUsername.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkPasswordQuery = "select Password from [Table] where UserName = '" + TextBoxUsername.Text + "'";
            SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
            string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
            if (password == TextBoxPassword.Text)
            {
                Session["New"] = TextBoxUsername.Text;
                Session["Time"] = 1;
                //Response.Write("Password is correct");
                Session["Login"] = 1;
                Session["Registration"] = 1;
                Response.Write("<script type='text/javascript'> window.location.href = 'googlemap.aspx';</script>");
            }
            else
            {
                //Response.Write("Password is not correct");
                Response.Write("<script type='text/javascript'> alert('帳號或密碼輸入錯誤!');</script>");
                Response.Write("<script type='text/javascript'> window.location.href = 'Login.aspx';</script>");
            }
        }
        else
        {
           // Response.Write("Username is not correct");
            Response.Write("<script type='text/javascript'> alert('帳號或密碼輸入錯誤!');</script>");
            Response.Write("<script type='text/javascript'> window.location.href = 'Login.aspx';</script>");
        }
    }
}
