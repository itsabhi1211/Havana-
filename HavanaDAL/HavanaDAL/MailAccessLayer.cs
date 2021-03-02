using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace HavanaDAL
{
   public class MailAccessLayer
    {

        /// <summary>
        /// code to send mail for contact us....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void SendContactMail(string mail,string username,string contactno,string datetime,string pathname,string year,string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]",problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to send mail for Verified Users....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void Sendfeedbackmail(string mail, string username, string contactno, string datetime, string pathname, string year, string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]", problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to send mail for Non Verified Users....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void SendNonVerificationMail(string mail, string username, string contactno, string datetime, string pathname, string year, string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]", problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to send mail for Approved members....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void SendMailforApprovedMembers(string mail, string username, string contactno, string datetime, string pathname, string year, string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]", problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to send mail for Denying the members....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void SendMailForDenyingMembers(string mail, string username, string contactno, string datetime, string pathname, string year, string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]", problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// code to send mail for Feedback Reply....
        /// </summary>
        /// <param name="mail"></param>
        /// <param name="username"></param>
        /// <param name="contactno"></param>
        /// <param name="datetime"></param>
        /// <param name="pathname"></param>
        /// <param name="year"></param>
        /// <param name="problem"></param>
        public static void SendFeedbackRply(string mail, string username, string contactno, string datetime, string pathname, string year, string problem)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", username);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);
                myString = myString.Replace("[Email]", mail);
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Problem]", problem);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static int ForgotPassword(string mail, string name, string username, string contactno, string datetime, string pathname, string year, string password)
        {
            try
            {
                StreamReader reader = new StreamReader(Path.GetFullPath(pathname));
                string readfile = reader.ReadToEnd();
                string myString = "";
                myString = readfile;
                myString = myString.Replace("[UserName]", name);
                myString = myString.Replace("[email]", mail);
                myString = myString.Replace("[Contact]", contactno);
                myString = myString.Replace("[DateTime]", datetime);            
                myString = myString.Replace("[Year]", year);
                myString = myString.Replace("[Password]", password);
                MailMessage msg = new MailMessage();
                MailAddress msgsender = new MailAddress("havanahomes4u@gmail.com");
                MailAddress msgreciever = new MailAddress(mail);
                SmtpClient client = new SmtpClient();
                ServicePointManager.ServerCertificateValidationCallback = delegate (object s, X509Certificate certificate, X509Chain chain, System.Net.Security.SslPolicyErrors sslPolicyErrors) { return true; };
                //client.Host = "relay-hosting.secureserver.net";
                //client.Port = 25;
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                //client.EnableSsl=false //for server
                client.Credentials = new System.Net.NetworkCredential("havanahomes4u@gmail.com", "CXZshek@123");
                msg.From = msgsender;
                msg.Subject = "Resoponse of Enquiry on Havana Pvt. Ltd";
                msg.To.Add(msgreciever);
                msg.Priority = MailPriority.High;
                msg.Bcc.Add(msgsender);
                msg.Body += myString.ToString();
                msg.IsBodyHtml = true;
                client.Send(msg);
                reader.Dispose();
                return 1;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
