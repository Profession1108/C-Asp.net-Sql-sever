using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            conn.Open();

            Button[] btnDemo = new Button[7];

            for (int i = 1; i < btnDemo.Length; i++)
            {
                string checkPasswordQuery = "select Cn from SC_AA where ky = '" + i + "'";
                SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                string text = passComm.ExecuteScalar().ToString();
                btnDemo[i] = new Button();
                btnDemo[i].ID = "" + i;
                btnDemo[i].Text = text;
                btnDemo[i].Height = 50;
                btnDemo[i].Width = 100;
                btnDemo[i].Click += new EventHandler(btnDemo_Click);
                Label5.Controls.Add(btnDemo[i]);
            }
            /*SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.Text;
            com.Connection = conn;
            com.CommandText = "select Cn from SC_AA";
            */
            /*SqlDataReader sqlDr = com.ExecuteReader();//從資料庫得到行
            DataTable dt = new DataTable();

            int iDrCount = sqlDr.FieldCount; //FieldCount  取得目前資料列中的資料行數目。
            //Response.Write(iDrCount);

            for (int iCnt = 0; iCnt < iDrCount; iCnt++)
            {
                string a = sqlDr.GetName(iCnt);
                dt.Columns.Add(a);
                //dt.Rows.Add((DataRow)sqlDr[iCnt]);
            }

            while (sqlDr.Read())//將DataReader前進到下一個資料
            {
                //定義一個數組，便於讀出每一行資料
                String[] subitems = new String[iDrCount];
                //用循環讀出每一行資料
                for (int iCnt = 0; iCnt < iDrCount; iCnt++)
                {
                    //讀出每一行資料保存到數組中
                    subitems[iCnt] = sqlDr[iCnt].ToString();
                    string sValue = sqlDr[iCnt].ToString();
                    Response.Write(subitems[0]);
                }
                //將讀出的行資料增表的行中
                dt.Rows.Add(subitems);

            }
            GridView1.DataSource = dt;

          
            sqlDr.Close(); 
            */
            conn.Dispose();
            conn.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }
    protected void btnDemo_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        conn.Open();
        Button temp = (Button)sender;

        string checkPasswordQuery1 = "select Ew from AB where Id = '" + temp.ID + "'";
        SqlCommand passComm1 = new SqlCommand(checkPasswordQuery1, conn);
        string text1 = passComm1.ExecuteScalar().ToString();
        string checkPasswordQuery2 = "select Sn from AB where Id = '" + temp.ID + "'";
        SqlCommand passComm2 = new SqlCommand(checkPasswordQuery2, conn);
        string text2 = passComm2.ExecuteScalar().ToString();

        // 建立一個 Table 物件並設定相關屬性。 
        Table Table1 = new Table();
        Table1.BackColor = Color.LightGreen;
        Table1.BorderWidth = 2;
        Table1.BorderStyle = BorderStyle.Outset;
        int numrows;
        int numcells;
        TableRow r;
        TableCell c;
        // 產生列與行。 
        numrows = Convert.ToInt32(2);
        numcells = Convert.ToInt32(2);
        for (int j = 0; j < numrows; j++)
        {
            r = new TableRow();
            r.BorderWidth = 1;
            for (int i = 0; i < numcells; i++)
            {
                c = new TableCell();
                c.BorderWidth = 1;
                r.Cells.Add(c);
            }
            Table1.Rows.Add(r);
        }
        Label1.Text = "Ew";
        Table1.Rows[0].Cells[0].Controls.Add(Label1);
        Label2.Text = "Yr";
        Table1.Rows[0].Cells[1].Controls.Add(Label2);
        Label3.Text = text1;
        Table1.Rows[1].Cells[0].Controls.Add(Label3);
        Label4.Text = text2;
        Table1.Rows[1].Cells[1].Controls.Add(Label4);
        Label1.Visible = true;
        Label2.Visible = true;
        Label3.Visible = true;
        Label4.Visible = true;
        // 將 Table1物件加入網頁中。 
        Label5.Controls.Add(Table1);
        conn.Dispose();
        conn.Close();
    }
}
