using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;

public partial class googlemap : System.Web.UI.Page
{
    int i = 0;
    int j = 0;
    string[] array = new string[200];    
    string Ews, Sns;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
       String Login = Convert.ToString(Session["Login"]);
       if (Login == "1"){}
       else
       {
           Response.Write("<script type='text/javascript'> alert('請勿非法進入!');</script>");
           Response.Write("<script type='text/javascript'> window.location.href = 'Login.aspx';</script>");
       }
        conn.Open();
        string checkEw = "select Id from AB";
        SqlCommand Ew = new SqlCommand(checkEw, conn);
        using (SqlDataReader dr = Ew.ExecuteReader())
        {
            while ((dr.Read()))
            {
                if (!dr[0].Equals(DBNull.Value))
                {
                    array[i] = dr[0].ToString();
                    i++;
                }
            }
            Session["Ewtime"] = i;
            //Label1.Text = Convert.ToString(i);
        }
        Ew.ExecuteNonQuery();
        for (j = 0; j < i; j++)
        {
            checkEw = "select Ew from AB where Id = '" + array[j] + "'";
            Ew = new SqlCommand(checkEw, conn);
            Ews = Ew.ExecuteScalar().ToString();
            string checkSn = "select Sn from AB where Id = '" + array[j] + "'";
            Ew.ExecuteNonQuery();
            SqlCommand Sn = new SqlCommand(checkSn, conn);
            Sns = Sn.ExecuteScalar().ToString();
            Sn.ExecuteNonQuery();
            string jsq = "<script>SnsEws('" + Sns + "','" + Ews + "');</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), jsq);
        }
        conn.Dispose();
        conn.Close();            
    }
    /*
    [System.Web.Services.WebMethod]
    public static string cs(int time)
    {
        string[] array = new string[200];
        int i = 0;
        string Ews,Sns;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string checkEw1 = "select Id from AB";

        SqlCommand Ew1 = new SqlCommand(checkEw1, conn);
        using (SqlDataReader dr = Ew1.ExecuteReader())
        {               
            while ((dr.Read()))
            {
                if (!dr[0].Equals(DBNull.Value))
                {
                    array[i] = dr[0].ToString();
                    i++;
                }
            }
        }
        string checkEw = "select Ew from AB where Id = '" + array[time] + "'";
 
        SqlCommand Ew = new SqlCommand(checkEw, conn);
        Ews = Ew.ExecuteScalar().ToString();
        string checkSn = "select Sn from AB where Id = '" + array[time] + "'";
        Ew.ExecuteNonQuery(); 
        SqlCommand Sn = new SqlCommand(checkSn, conn);
        Sns = Sn.ExecuteScalar().ToString();
        Ew.ExecuteNonQuery(); 
        conn.Dispose();
        conn.Close();
        return Convert.ToString(-14.3);
       */
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        /*
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string checkEw = "select Ew from AB where Id = '" + array[j] + "'";
        SqlCommand Ew = new SqlCommand(checkEw, conn);
        Ews = Ew.ExecuteScalar().ToString();
        Session["Ews"] = Ews;
        string checkSn = "select Sn from AB where Id = '" + array[j] + "'";
        Ew.ExecuteNonQuery();
        SqlCommand Sn = new SqlCommand(checkSn, conn);
        Sns = Sn.ExecuteScalar().ToString();
        Session["Sns"] = Sns;
        Sn.ExecuteNonQuery();
        j++;
        if (j > 139)
        {
            Timer1.Enabled = false;
        }
        conn.Dispose();
        conn.Close();
         */
    }
}  
