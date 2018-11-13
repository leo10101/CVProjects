﻿<%@ Page Language="C#" MasterPageFile="~/StoreSupervisor.Master" AutoEventWireup="true" CodeBehind="SupervisorHomePage.aspx.cs" Inherits="AD.Store.SupervisorHomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

	<style>
		.padding {
			padding-top: 30px;
			padding-right: 10%;
		}

		.padding2 {
			padding-top: 30px;
			padding-bottom: 60px;
		}
        
        .btnYellow {
            font-family: Arial;
            font-size: large;
            height: 35px;
            width: 250px;
            color: #333333;
            background-color: #fbc531;
            border: none;
            margin: 10px;
            font-weight: bold;
        }

		#left {
			float: left;
			padding-top: 30px;
			padding-bottom: 30px;
		}

		#right {
			float: right;
			padding-top: 30px;
			padding-bottom: 30px;
		}

		#GridView1 tr.rowHover:hover {
			background-color: #DDDDDD;
			font-weight: lighter;
		}

		#GridView1 tr {
			color: Black;
			height: 0px;
			text-align: center;
			font-weight: lighter;
			colspan ="100%";
			font-size: 15px;
		}

		#GridView1 th {
			background-color: #808080;
			border: none;
			text-align: center;
			font-weight: bolder;
			font-size: 25px;
			padding: 8px;
			color: Black;
			height: 30px;
		}

		#page {
		background-color: #666666;
			color: white;
			border: none;
			min-height: 500px;
			font-size: 18px;
			font-family: Arial, Helvetica, sans-serif;
			padding-top:10px;
			opacity:0.9;
		}

		</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

	<div id="page" class="container container-fluid" style="width:100%;text-align:center;">
      

        
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Welcome Back"></asp:Label>
        <asp:Label ID="lab_supervisor" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" />
        <br />
        <asp:Label ID="lab_id" runat="server" Text="EmployeeID"></asp:Label>
        <asp:Label ID="lab_employeeID" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_name" runat="server" Text="EmployeeName"></asp:Label>
        <asp:Label ID="lab_employeeName" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_dept" runat="server" Text="Department"></asp:Label>
        <asp:Label ID="lab_department" runat="server"></asp:Label>
        <br/>
        <asp:Label ID="lab_rol" runat="server" Text="Role"></asp:Label>
        <asp:Label ID="lab_role" runat="server"></asp:Label>
		</div>
</asp:Content>