<%@ Page Title="Real AJAX" Language="C#" MasterPageFile="~/RootTemplate.Master" AutoEventWireup="true" CodeBehind="RealAjax.aspx.cs" Inherits="twitter_bootstrap_experiment.Comparison.RealAjax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <h1>Regular AJAX panels</h1>
        <%-- Can switch between RadAjaxPanel and RadAjaxManager by toggling commenting. --%>
        <h2>Random Motorcycles</h2>
        <telerik:RadGrid ID="MotorcycleGrid" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="MotorcycleDataSource"
            GroupPanelPosition="Top" Width="100%">
            <MasterTableView AutoGenerateColumns="False" DataSourceID="MotorcycleDataSource" DataKeyNames="MotorcycleID">
                <Columns>
                    <telerik:GridBoundColumn DataField="MotorcycleID" DataType="System.Guid" FilterControlAltText="Filter MotorcycleID column" HeaderText="MotorcycleID" SortExpression="MotorcycleID" UniqueName="MotorcycleID" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Name" FilterControlAltText="Filter Name column" HeaderText="Name" SortExpression="Name" UniqueName="Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Manufacturer" FilterControlAltText="Filter Manufacturer column" HeaderText="Manufacturer" SortExpression="Manufacturer" UniqueName="Manufacturer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Year" DataType="System.Int32" FilterControlAltText="Filter Year column" HeaderText="Year" SortExpression="Year" UniqueName="Year">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Price" DataType="System.Decimal" FilterControlAltText="Filter Price column" HeaderText="Price" SortExpression="Price" UniqueName="Price">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Sku" DataType="System.Int32" FilterControlAltText="Filter Sku column" HeaderText="Sku" SortExpression="Sku" UniqueName="Sku" Display="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <div>
            <h2>Search & Save</h2>
            <telerik:RadTextBox ID="SearchBox" runat="server" Text="" EmptyMessage="Motorcycle Name" Width="65%" ClientIDMode="Static"></telerik:RadTextBox>
            <telerik:RadButton ID="SearchButton" runat="server" Text="Search Names" Width="34%" OnClientClicked="onSearchClick" AutoPostBack="false"></telerik:RadButton>
            <telerik:RadListBox ID="SearchResultsList" runat="server" Height="400px" Width="40%" ClientIDMode="Static"
                AllowTransfer="true" EnableDragAndDrop="true" TransferToID="SelectionResults" ButtonSettings-AreaWidth="35px"
                DataKeyField="MotorcycleID" AllowTransferOnDoubleClick="true" TransferMode="Move" DataTextField="Fullname">
                <EmptyMessageTemplate>
                    No motorcycles found with a name matching the search criteria.
                </EmptyMessageTemplate>
            </telerik:RadListBox>
            <telerik:RadListBox runat="server" ID="SelectionResults" Height="400px" Width="40%" ClientIDMode="Static"
                DataKeyField="MotorcycleID" EnableDragAndDrop="true" AllowTransferOnDoubleClick="true">
                <EmptyMessageTemplate>
                    No motorcycles selected.
                </EmptyMessageTemplate>
            </telerik:RadListBox>
            <telerik:RadButton ID="SaveButton" runat="server" Text="Save" OnClientClicked="onSaveClick" AutoPostBack="false" />
        </div>
        <div>
            <h2>Saved Items</h2>
            <telerik:RadListBox ID="SavedItems" runat="server" Width="100%" DataKeyField="MotorcycleID" DataTextField="FullName"
                ClientIDMode="Static">
                <EmptyMessageTemplate>
                    No saved motorcycles.
                </EmptyMessageTemplate>
            </telerik:RadListBox>
        </div>
        <asp:ObjectDataSource ID="MotorcycleDataSource" runat="server" SelectMethod="GetAll"
            TypeName="twitter_bootstrap_experiment.Library.MotorcycleHelper">
            <SelectParameters>
                <asp:Parameter DefaultValue="10" Name="count" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>