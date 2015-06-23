<%@ Page Title="Grid Test" Language="C#" MasterPageFile="~/RootTemplate.Master" AutoEventWireup="true" CodeBehind="GridTest.aspx.cs" Inherits="twitter_bootstrap_experiment.Lists.GridTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
    <style type="text/css">
        @media only screen and (max-width: 700px) {
            .bm-responsive-column { display: none !important; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <h1>Grid Test</h1>
        <telerik:RadGrid ID="Grid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" Width="100%"
            AllowSorting="True" DataSourceID="GridDataSource" CellSpacing="-1" GridLines="Both" OnItemDataBound="Grid_ItemDataBound">
            <MasterTableView DataSourceID="GridDataSource" AutoGenerateColumns="False" DataKeyNames="MotorcycleID"
                OverrideDataSourceControlSorting="true">
                <Columns>
                    <telerik:GridBoundColumn DataField="MotorcycleID" DataType="System.Int32" FilterControlAltText="Filter MotorcycleID column" HeaderText="MotorcycleID" SortExpression="MotorcycleID" UniqueName="MotorcycleID" 
                        HeaderStyle-CssClass="bm-responsive-column" ItemStyle-CssClass="bm-responsive-column" FooterStyle-CssClass="bm-responsive-column">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Manufacturer" FilterControlAltText="Filter Manufacturer column" HeaderText="Manufacturer" SortExpression="Manufacturer" UniqueName="Manufacturer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Year" DataType="System.Int32" FilterControlAltText="Filter Year column" HeaderText="Year" SortExpression="Year" UniqueName="Year">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Price" DataType="System.Decimal" FilterControlAltText="Filter Price column" HeaderText="Price" SortExpression="Price" UniqueName="Price" DataFormatString="{0:C2}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sku" DataType="System.Guid" FilterControlAltText="Filter Sku column" HeaderText="Sku" SortExpression="Sku" UniqueName="Sku" 
                        HeaderStyle-CssClass="bm-responsive-column" ItemStyle-CssClass="bm-responsive-column" FooterStyle-CssClass="bm-responsive-column">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:ObjectDataSource ID="GridDataSource" runat="server" SelectMethod="GetAll"
            TypeName="twitter_bootstrap_experiment.Library.MotorcycleHelper" EnableCaching="true" CacheDuration="600">
            <SelectParameters>
                <asp:Parameter DefaultValue="100" Name="count" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
