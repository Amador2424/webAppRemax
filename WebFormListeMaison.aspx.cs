using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebAppRemax
{
    public partial class WebFormListeMaison : System.Web.UI.Page
    {
        RemaxSQLEntities2 myEntity;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myEntity= new RemaxSQLEntities2();
                string prop = Request.QueryString["prop"];
                int prix = Convert.ToInt32(Request.QueryString["prix"]);
                int superficie = Convert.ToInt32(Request.QueryString["superficie"]);
                string opt = Request.QueryString["opt"];
                string agent = Request.QueryString["agent"];

                var maison = from Maison m in myEntity.Maisons
                             where m.propriete == prop && m.option == opt && m.prix <= prix && m.superficie <= superficie
                             select new
                             {
                                 sup = m.superficie,
                                 optio = m.option,
                                 price = m.prix,
                                 propi = m.propriete,
                                 agent = m.refAgent
                             };

                rptResults.DataSource = maison.ToList();
                rptResults.DataBind();


                ListAgent.DataSource = maison.ToList();
                ListAgent.DataTextField = "agent";
                ListAgent.DataBind();
                TextMessage.Visible= BtnEnvoyer.Visible = TextEnvoyeur.Visible= TextTitre.Visible = false;
            }

        }

        protected void rptResults_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void ListAgent_SelectedIndexChanged(object sender, EventArgs e)
        {
         
            TextMessage.Visible =BtnEnvoyer.Visible= TextEnvoyeur.Visible= TextTitre.Visible = true;
         
        }

        protected void BtnEnvoyer_Click(object sender, EventArgs e)
        {
            if (myEntity == null)
            {
                myEntity = new RemaxSQLEntities2();
            }
            string agent_numero = ListAgent.SelectedItem.Text.ToString();
            TextMessage.Visible = BtnEnvoyer.Visible = TextEnvoyeur.Visible = true;
            string message = TextMessage.Text.ToString();
            Message mess = new Message();
            mess.refAgent = agent_numero;
            mess.date = DateTime.Now.ToString();
            mess.envoyeur = TextEnvoyeur.Text;
            mess.nouveau = "Oui";
            mess.titre = TextTitre.Text;

            myEntity.Messages.Add(mess);
            myEntity.SaveChanges();
            if (Page.IsValid)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "alert", "alert('Le message a été envoyé avec succès.');", true);

            }


        }
    }
}