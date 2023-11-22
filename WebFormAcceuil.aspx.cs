using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebAppRemax
{
    public partial class WebFormAcceuil : System.Web.UI.Page
    {
        RemaxSQLEntities2 myEntity;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                myEntity = new RemaxSQLEntities2();
               


                var option = from Maison maison in myEntity.Maisons
                                select new
                                {
                                    Option = maison.option
                                };
                ddlSearchOptions.DataSource = option.Distinct().ToList();
                ddlSearchOptions.DataTextField = "Option";
                ddlSearchOptions.DataValueField = "Option";
                ddlSearchOptions.DataBind();

                var propriete = from Maison maison in myEntity.Maisons
                        select new
                        {
                            Prop = maison.propriete
                        };
                ddlSearchProperty.DataSource = propriete.Distinct().ToList();
                ddlSearchProperty.DataTextField = "Prop";
                ddlSearchProperty.DataValueField = "Prop";
                ddlSearchProperty.DataBind();



                 var ville = from Maison maison in myEntity.Maisons
                        select new
                        {
                            Ville = maison.ville
                        };
                ddlSearchCities.DataSource = ville.Distinct().ToList();
                ddlSearchCities.DataTextField = "Ville";
                ddlSearchCities.DataValueField = "Ville";
                ddlSearchCities.DataBind();



            }

        }

        protected void ddlSearchOptions_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (myEntity == null)
            {
                myEntity = new RemaxSQLEntities2();
            }

            string prop = ddlSearchProperty.SelectedItem.Text.ToString();
            int prix = Convert.ToInt32(txtSearchPrice.Text);
            int superficie = Convert.ToInt32(txtSearchSuperficie.Text);
            string opt = ddlSearchOptions.SelectedItem.Text.ToString();

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
            string query = string.Format("?prop={0}&prix={1}&superficie={2}&opt={3}&sup={4}&optio={5}&price={6}&propi={7}&agent={8}",
                               prop, prix, superficie, opt,
                               maison.FirstOrDefault().sup, maison.FirstOrDefault().optio,
                               maison.FirstOrDefault().price, maison.FirstOrDefault().propi,
                               maison.FirstOrDefault().agent);

            Response.Redirect("WebFormListeMaison.aspx" + query);

        }

    }
}