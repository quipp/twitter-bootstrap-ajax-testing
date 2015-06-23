<%@ Page Title="Start New Job" Language="C#" MasterPageFile="~/RootTemplate.Master" AutoEventWireup="true" CodeBehind="FreshJobBasics.aspx.cs" Inherits="twitter_bootstrap_experiment.FreshJobBasics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <h1>Start New Job</h1>
        <div class="form-inline">
            <div class="form-group col-sm-4">
                <label>Corporation</label>
            </div>
            <div class="form-group col-sm-4">
                <label>Market</label>
            </div>
            <div class="form-group col-sm-4">
                <label>Sales Person</label>
            </div>
        </div>
        <div>
            <h2>Account Information</h2>
            <div class="row">
                <div class="form-group col-sm-3">
                    <label class="col-xs-4">Account</label>
                    <div class="col-xs-8">
                        <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                </div>
                <div class="form-group col-sm-3">
                    <label>Date Required</label>
                    <input type="date" />
                </div>
                <div class="form-group col-sm-3">
                    <label>
                        <input type="checkbox" />
                        Rush</label>
                </div>
                <div class="form-group col-sm-3">
                    <label>
                        <input type="checkbox" />
                        Overnight</label>
                </div>
            </div>
        </div>
        <div>
            <h2>Notes</h2>
            <textarea class="form-control" rows="5"></textarea>
        </div>
        <div class="form-group">
            <label>Attachments</label>
            <input type="file" />
        </div>
        <button type="submit" class="btn btn-default">Save</button>
        <button type="submit" class="btn btn-default">Next</button>
    </div>
</asp:Content>