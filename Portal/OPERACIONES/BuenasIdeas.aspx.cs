﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OPERACIONES_BuenasIdeas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IDE_USUARIO"] == null)
        {
            Response.Redirect("~/default.aspx");
        }
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Request.Browser.IsMobileDevice)
            MasterPageFile = "~/Templates/SiteMovil.master";
    }

    //protected void btnBases_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/operaciones/BuenasIdeasBases.aspx");
    //}

    //protected void btnIngresar_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/operaciones/BuenasIdeasRegistro.aspx");
    //}
}