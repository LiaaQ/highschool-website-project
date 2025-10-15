using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DMPStranka
{
    public partial class Default : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(!IsPostBack)
            {
                    Odhlaseni.Visible = false;
                    secret.Visible = false;
            }
            
        }

        protected void Registrace_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#ModalRegister').modal()", true);
        }
        protected void Prihlaseni_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#ModalLogin').modal()", true);
        }

        protected void btnOdeslat_Click(object sender, EventArgs e)
        {
            
            try
            {
                MailMessage mail = new MailMessage(txtOdesilatelEmail.Text, "natallienattsso@seznam.cz");
                mail.Subject = txtPredmet.Text;
                mail.Body = "Email Vám posílá " + txtJmeno.Text + "." + Environment.NewLine + txtZprava.Text;

                SmtpClient smtp = new SmtpClient("mail.sps-jia.cz");
                smtp.Send(mail);
                lblInfo.Text = "Email byl úspěšně odeslán.";

                txtPredmet.Text = "";
                txtZprava.Text = "";
                txtOdesilatelEmail.Text = "";

                }
            catch
            {
                lblInfo.Text = "Email se nepodařilo odeslat.";
                txtPredmet.Text = "";
                txtZprava.Text = "";
                txtOdesilatelEmail.Text = "";
                }
            }

        protected void btnRegistrace_Click(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            loginError.Visible = false;
            loginPasswordError.Visible = false;
            loginSuccess.Visible = false;
            registerEmailError.Visible = false;
            registerUsernameError.Visible = false;
            registerSuccess.Visible = false;
            missingInfo.Visible = false;

            if (txtUser.Text == "" || txtEmail.Text == "" || txtHeslo.Text=="")
            {
                missingInfo.Visible = true;
            }
            else
            {
                string stringCheckUsername = "SELECT COUNT(*) FROM Users WHERE username=@username";
                SqlCommand checkUsername = new SqlCommand(stringCheckUsername, conn);

                checkUsername.Parameters.AddWithValue("@username", txtUser.Text);


                string stringCheckEmail = "SELECT COUNT(*) FROM Users WHERE email=@email";
                SqlCommand checkEmail = new SqlCommand(stringCheckEmail, conn);

                checkEmail.Parameters.AddWithValue("@email", txtEmail.Text);


                string stringRegister = "INSERT INTO Users (username, email, password) VALUES (@username,@email,@password)";
                SqlCommand register = new SqlCommand(stringRegister, conn);

                register.Parameters.AddWithValue("@username", txtUser.Text);
                register.Parameters.AddWithValue("@email", txtEmail.Text);
                register.Parameters.AddWithValue("@password", txtHeslo.Text);


                conn.Open();

                int countUsername = Convert.ToInt32(checkUsername.ExecuteScalar());
                int countEmail = Convert.ToInt32(checkEmail.ExecuteScalar());

                if (countUsername == 1 || countEmail == 1)
                {
                    if (countUsername == 1)
                    {
                        registerUsernameError.Visible = true;
                        txtUser.Text = "";
                        txtEmail.Text = "";
                    }
                    if (countEmail == 1)
                    {
                        registerEmailError.Visible = true;
                        txtUser.Text = "";
                        txtEmail.Text = "";
                    }
                }
                else
                {
                    register.ExecuteNonQuery();
                    txtUser.Text = "";
                    txtEmail.Text = "";
                    txtHeslo.Text = "";
                    registerSuccess.Visible = true;
                }

                conn.Close();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#ModalNotif').modal()", true);
        }

        [Obsolete]
        protected void btnLogin_Click(object sender, EventArgs e)

        {
            string connString = ConfigurationManager.ConnectionStrings["mycon"].ToString();
            SqlConnection conn = new SqlConnection(connString);

            loginError.Visible = false;
            loginPasswordError.Visible = false;
            loginSuccess.Visible = false;
            registerEmailError.Visible = false;
            registerUsernameError.Visible = false;
            registerSuccess.Visible = false;
            missingInfo.Visible = false;

            string stringCheckLogin = "SELECT COUNT(*) FROM Users WHERE (username=@useremail AND password=@password) OR (email=@useremail AND password=@password)";
            SqlCommand checkLogin = new SqlCommand(stringCheckLogin, conn);

            checkLogin.Parameters.AddWithValue("@useremail", txtLoginUserOrEmail.Text);
            checkLogin.Parameters.AddWithValue("@password", txtLoginPass.Text);

            conn.Open();

            int countLogin = Convert.ToInt32(checkLogin.ExecuteScalar());

            conn.Close();

            if (countLogin==1)
            {
                string stringUsername = "select username from Users where (username=@useremail AND password=@password) or (email=@useremail AND password=@password)";
                SqlCommand username = new SqlCommand(stringUsername, conn);

                username.Parameters.AddWithValue("@useremail", txtLoginUserOrEmail.Text);
                username.Parameters.AddWithValue("@password", txtLoginPass.Text);

                conn.Open();

                Session["currentUser"] = username.ExecuteScalar().ToString();

                conn.Close();


                lblPrihlasen.Text = Session["currentUser"].ToString();
                loginSuccess.Visible = true;

                txtLoginUserOrEmail.Text = "";
                txtLoginPass.Text = "";

                Odhlaseni.Visible = true;
                Prihlaseni.Visible = false;
                Registrace.Visible = false;
                secret.Visible = true;
                secretPred.Visible = false;
                RegistraceDole.Visible = false;
                PrihlaseniDole.Visible = false;

            }
            else 
            {
                string stringCheckUserEmail = "select count(*) from Users where username=@useremail OR email=@useremail";
                SqlCommand checkUserEmail = new SqlCommand(stringCheckUserEmail, conn);

                checkUserEmail.Parameters.AddWithValue("@useremail", txtLoginUserOrEmail.Text.ToString());

                string stringCheckPassword = "select count(*) from Users where password=@password";
                SqlCommand checkPassword = new SqlCommand(stringCheckPassword, conn);

                checkPassword.Parameters.AddWithValue("@password", txtLoginPass.Text.ToString());

                conn.Open();

                int countUserEmail = Convert.ToInt32(checkUserEmail.ExecuteScalar());
                int countPassword = Convert.ToInt32(checkPassword.ExecuteScalar());

                conn.Close();

                if (countUserEmail==0 || countPassword==0)
                {
                    if(countPassword==0)
                    {
                        loginPasswordError.Visible = true;
                    }
                    if(countUserEmail==0)
                    {
                        
                        loginError.Visible = true;
                        loginPasswordError.Visible = false;
                    }
                }

                if(txtLoginUserOrEmail.Text=="" || txtLoginPass.Text=="")
                {
                    missingInfo.Visible = true;
                    loginPasswordError.Visible = false;
                    loginError.Visible = false;
                }
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#ModalNotif').modal()", true);
        }

        protected void Odhlaseni_Click(object sender, EventArgs e) 
        {
            Odhlaseni.Visible = false;
            Prihlaseni.Visible = true;
            Session.Remove("currentUser");
            lblPrihlasen.Visible = false;
            Registrace.Visible = true;
            secret.Visible = false;
            secretPred.Visible = true;
            PrihlaseniDole.Visible = true;
            RegistraceDole.Visible = true;
        }



    }
}