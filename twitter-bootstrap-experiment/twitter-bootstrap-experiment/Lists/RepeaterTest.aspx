<%@ Page Title="" Language="C#" MasterPageFile="~/RootTemplate.Master" AutoEventWireup="true" CodeBehind="RepeaterTest.aspx.cs" Inherits="twitter_bootstrap_experiment.Lists.RepeaterTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <h1>Repeater</h1>
        <asp:Repeater ID="MotorcycleListing" runat="server" DataSourceID="GridDataSource">
            <ItemTemplate>
                <div class="col-md-6 panel panel-default well well-sm">
                    <div class="panel-body" data-moto-id='<%#Eval("MotorcycleID")%>'>
                        <div class="col-sm-6">
                            <div class="col-sm-6">
                                <label>Name</label>
                                <%#Eval("Name")%>
                            </div>
                            <div class="col-sm-6">
                                <label>MFG</label>
                                <%#Eval("Manufacturer")%>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="col-sm-4">
                                <label>SKU</label>
                                <%#Eval("Sku")%>
                            </div>
                            <div class="col-sm-4">
                                <label>Year</label>
                                <%#Eval("Year")%>
                            </div>
                            <div class="col-sm-4">
                                <label>Price</label>
                                <%#Eval("Price")%>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="GridDataSource" runat="server" SelectMethod="GetAll"
            TypeName="twitter_bootstrap_experiment.Library.MotorcycleHelper" EnableCaching="true" CacheDuration="600">
            <SelectParameters>
                <asp:Parameter DefaultValue="100" Name="count" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
